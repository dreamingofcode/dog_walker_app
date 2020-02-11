class User < ApplicationRecord
    has_many :appointments 
    has_many :dogs
    has_many :walkers, through: :appointments
end
