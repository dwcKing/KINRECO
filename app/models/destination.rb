class Destination < ApplicationRecord
  belongs_to :end_user

  validates :post_code, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_kana, presence: true
  validates :first_kana, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :end_user_id, presence: true

  def view_name_and_address
    self.last_name + self.first_name + '(' + self.address + ')'
  end
end
