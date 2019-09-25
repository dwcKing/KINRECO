class Order < ApplicationRecord
  enum payment: %i[代引 クレジットカード 銀行振込]
  enum order_status: %i[注文受付済 入金待ち 発送準備中 発送済み]
  has_many :items_orders,dependent: :destroy
  has_many :items, through: :items_orders,dependent: :destroy  #  order.items
  belongs_to :end_user

  has_many :items, through: :items_orders

  validates :order_status, presence: true
  validates :delivery_charge, presence: true
  validates :post_code, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_kana, presence: true
  validates :first_kana, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :payment, presence: true
  validates :end_user_id, presence: true

end

