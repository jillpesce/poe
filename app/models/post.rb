class Post < ApplicationRecord
  belongs_to :user
  has_many :associations, dependent: :destroy
  has_many :tags, through: :associations

  validates :user, presence: true
  validates :text, presence: true
end
