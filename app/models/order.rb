class Order < ApplicationRecord
  enum payment: %i[現金決済 クレジットカード 携帯決済]
  enum order_status: %i[注文受付済 入金待ち 発送準備中 発送済み]
  has_many :items_orders,dependent: :destroy
  has_many :items, through: :items_orders,dependent: :destroy  #  order.items
  belongs_to :end_user
end

