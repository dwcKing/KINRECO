class CartContent < ApplicationRecord
  belongs_to :item
  belongs_to :end_user

  validates :item_id, presence: true
  validates :end_user_id, presence: true
  validates :quantity, presence: true
end
