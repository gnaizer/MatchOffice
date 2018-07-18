class Card < ApplicationRecord
  scope :unopened, -> { where(opened: false) }
  scope :opened, -> { where(opened: true) }

  enum suit: [ :spade, :heart, :club, :diamond ]
  enum card: { '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, 'joker': 0 }
end
