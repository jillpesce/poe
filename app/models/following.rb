class Following < ApplicationRecord
    belongs_to :person
    belongs_to :follower, :class_name => 'User'
end
