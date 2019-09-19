class ItemsImage < ApplicationRecord
	belongs_to :item
    attachment :image
end
