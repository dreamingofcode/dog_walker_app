class Review < ApplicationRecord
    belongs_to :appointment
    validates :rating, presence: true
    validates :comment, presence: true
end
