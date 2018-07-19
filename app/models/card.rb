class Card < ApplicationRecord

  has_many :users, through: :card_users
  has_many :card_users

  scope :opened, -> (user_id) { includes(:card_users).where(card_users: { user_id: user_id }) }
  scope :unopened, -> { left_outer_joins(:card_users).where(card_users: { id: nil }) }

  enum suit: [ :spade, :heart, :club, :diamond ]
  enum card: { '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, 'joker': 0 }
end
