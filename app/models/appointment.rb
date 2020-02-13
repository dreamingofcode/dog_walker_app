class Appointment < ApplicationRecord
    belongs_to :user
    belongs_to :walker
    has_many :reviews
    accepts_nested_attributes_for :reviews
    validates :user, presence: true
    validates :walker, presence: true 
    validates :date, presence: true
    
end
