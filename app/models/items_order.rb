class ItemsOrder < ApplicationRecord
  belongs_to :item
  belongs_to :order

  validates :tax_add_price, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :item_id, presence: true
  validates :order_id, presence: true
end
