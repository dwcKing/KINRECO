class Destination < ApplicationRecord
  belongs_to :end_user
  
  def view_name_and_address
    self.last_name + self.first_name + '(' + self.address + ')'
  end
end
