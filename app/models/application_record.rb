class ApplicationRecord < ActiveRecord::Base

  self.abstract_class = true

  @items = Item.select(:title)
end
