class Disc < ApplicationRecord
	belongs_to :item

	has_many :songs, inverse_of: :disc, dependent: :destroy
    accepts_nested_attributes_for :songs, reject_if: :all_blank, allow_destroy: true
end
