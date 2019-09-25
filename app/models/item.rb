class Item < ApplicationRecord
  enum disc_type: %i[シングル アルバム]

  has_many :arrivals , dependent: :destroy, inverse_of: :item
  accepts_nested_attributes_for :arrivals, reject_if: :all_blank, allow_destroy: true
  has_many :cart_contents, dependent: :destroy
  has_many :end_users, through: :cart_contents, dependent: :destroy
  has_many :items_orders, dependent: :destroy
  has_many :orders, through: :items_orders, dependent: :destroy

  validates :title, presence: true
  validates :price, presence: true
  validates :artist, presence: true
  validates :disc_type, presence: true
  validates :selling_status, presence: true
  validates :comment, presence: true

  has_many :items_images, dependent: :destroy
  accepts_attachments_for :items_images, attachment: :image

  has_many :discs, inverse_of: :item, dependent: :destroy
  accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true
  belongs_to :genre
  belongs_to :label
  enum selling_status:{販売中:1,販売停止中:0}
  has_many :likes, dependent: :destroy
  has_many :liked_end_users, through: :likes, source: :end_user

end
