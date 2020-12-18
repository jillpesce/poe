class Tag < ApplicationRecord
    has_many :associations, dependent: :destroy
    has_many :posts, through: :associations
end
