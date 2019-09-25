class ItemsOrder < ApplicationRecord
  belongs_to :item
  belongs_to :order

  validates :tax_add_price, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
end
