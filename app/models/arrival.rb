class Arrival < ApplicationRecord
	belongs_to :item
  validates :arrivals_quantity, presence: true
	validates :arrivals_date, presence: true
end
