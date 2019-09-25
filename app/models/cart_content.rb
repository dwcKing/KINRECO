class CartContent < ApplicationRecord
  belongs_to :item
  belongs_to :end_user

  validates :quantity, presence: true
end
