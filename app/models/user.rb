class User < ApplicationRecord
    has_secure_password
  

    has_many :appointments 
    has_many :dogs
    has_many :walkers, through: :appointments

    validates :name, presence: true
    validates :username, presence: true
    validates :username, uniqueness: true
    validates :password, presence: true
   


end
