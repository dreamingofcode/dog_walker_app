class Dog < ApplicationRecord
    has_one :user
    has_one :walker, through: :user
    has_many :appointments, through: :user
    validates :name, presence: true
    validates :breed, presence: true
end
