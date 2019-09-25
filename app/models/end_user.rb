class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,

         :recoverable, :rememberable, :validatable
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_kana, presence: true
  validates :first_kana, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true
  validates :post_code, presence: true
  validates :address, presence: true

  has_many :cart_contents
  has_many :items, through: :cart_contents
  has_many :destinations
  has_many :likes, dependent: :destroy
  has_many :liked_items, through: :likes, source: :items
  has_many :orders
  def already_liked?(item)
    self.likes.exists?(item_id: item.id)
  end

  acts_as_paranoid


end
