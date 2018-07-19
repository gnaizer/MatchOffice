class CardsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_card, only: [:show, :edit]

  def index; end

  def show
    @card.update(opened: true)
  end

  def update
    @cards = Card.opened(params[:user_id])
    cards_json = @cards.to_json
    @cards.card_users.destroy_all
    respond_to do |format|
      format.json { render json: cards_json }
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
