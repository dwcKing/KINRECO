class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
<<<<<<< HEAD
         :recoverable, :rememberable
=======
         :recoverable, :rememberable, :validatable

  has_many :cart_contents
  has_many :destinations
>>>>>>> aa408a8edbf4e3748f94fdd94f9ccf846cd38b46
end
