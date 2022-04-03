class Task < ApplicationRecord

    validates :description, presence: true
    
    belongs_to :goal
    has_one :user, through: :goal

    scope :complete, -> { where("completed = true") }
    scope :incomplete, -> { where("completed = false") }

end
