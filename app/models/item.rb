class Item < ApplicationRecord
  enum disc_type: %i[シングル アルバム]

  has_many :arrivals

end
