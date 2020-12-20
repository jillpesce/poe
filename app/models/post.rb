class Post < ApplicationRecord
  belongs_to :user
  has_many :associations, dependent: :destroy
  has_many :tags, through: :associations

  validates :title, presence: true, length: { minimum: 3, maximum: 255 }
  validates :text, presence: true, length: { minimum: 5, maximum: 1000 }


end
