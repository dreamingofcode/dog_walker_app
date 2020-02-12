class Dog < ApplicationRecord
    belongs_to :user
    has_one :walker, through: :user
    has_many :appointments, through: :user
    validates :name, presence: true
    validates :breed, presence: true
end
