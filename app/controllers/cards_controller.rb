class CardsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_card, only: [:show, :edit]

  def index; end

  def show
    @card.update(opened: true)
  end

  def update
    @cards = Card.opened
    respond_to do |format|
        format.json { render json: @cards.to_json }
        # Card.opened.update_all(opened: false)
      end
  rescue
    respond_to  do |format|
      format.json { render json: { message: 'smth wrong' }, status: :unprocessable_entity }
    end
  end

  private

  def set_card
    random_id = Card.unopened.ids.sample
    @card = Card.find(random_id)
  end
end
