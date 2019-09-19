class Order < ApplicationRecord
  enum payment: %i[現金決済 クレジットカード 携帯決済]
  has_many :items, through: :items_orders
end
