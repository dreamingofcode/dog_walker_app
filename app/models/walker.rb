class Walker < ApplicationRecord
    has_many :appointments 
    has_many :users, through: :appointments
    has_many :reviews, through: :appointments
end
