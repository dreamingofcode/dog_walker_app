class Appointment < ApplicationRecord
    belongs_to :user
    belongs_to :walker
    has_many :reviews
    # validates :client, presence: true end
    # validates :dog_walker, presence: true end
    # validates :date_time, presence: true end
end
