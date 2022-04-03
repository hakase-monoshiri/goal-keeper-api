class Goal < ApplicationRecord

    belongs_to :user

    validates :name, presence: true


    has_many :tasks


    def percent_complete
        if self.tasks
            r = self.tasks.complete.count.to_f / self.tasks.count.to_f
            (r * 100).round
        else
            0
        end
    end
    
end
