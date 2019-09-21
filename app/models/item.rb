class Item < ApplicationRecord
  enum disc_type: %i[シングル アルバム]

  has_many :arrivals
  has_many :cart_contents
  has_many :end_users, through: :cart_contents
  has_many :items_orders
  has_many :orders, through: :items_orders






  has_many :items_images, dependent: :destroy
  accepts_attachments_for :items_images, attachment: :image

  has_many :discs, inverse_of: :item
  accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true
  belongs_to :genre
  belongs_to :label
  enum selling_status:{販売中:1,販売停止中:0}
end