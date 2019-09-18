class Item < ApplicationRecord
  enum disc_type: %i[シングル アルバム]

  has_many :arrivals
  has_many :end_users, through: :cart_contents
  has_many :orders, through: :items_orders
end
