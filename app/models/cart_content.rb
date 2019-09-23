class CartContent < ApplicationRecord
  belongs_to :item
  belongs_to :end_user

end
