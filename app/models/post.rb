class Post < ApplicationRecord
  belongs_to :user
  has_many :associations, dependent: :destroy
  has_many :tags, through: :associations
end
