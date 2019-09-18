class Order < ApplicationRecord
  enum payment: %i[現金決済 クレジットカード 携帯決済]

end
