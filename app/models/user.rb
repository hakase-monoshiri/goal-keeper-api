class User < ApplicationRecord
    
    has_many :goals
    has_many :tasks, through: :goals

    has_secure_password

    validates :email, presence: true
    validates :email, uniqueness: {case_sensitive: false} 

end
