class Item < ApplicationRecord
  enum disc_type: %i[シングル アルバム]

  has_many :arrivals

  has_many :cart_contents
end
