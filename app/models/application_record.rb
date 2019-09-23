class ApplicationRecord < ActiveRecord::Base

  self.abstract_class = true

  @items = Item.pluck(:title).to_json.html_safe
end
