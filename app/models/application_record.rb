class ApplicationRecord < ActiveRecord::Base

before_action :setup_cart_item!,only:[:add_item, :update_item, :delete_item]
  self.abstract_class = true

end
