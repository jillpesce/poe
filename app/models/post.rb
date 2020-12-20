class Post < ApplicationRecord
  belongs_to :user
  has_many :associations, dependent: :destroy
  has_many :tags, through: :associations

  validates :title, presence: true, length: { minimum: 3, maximum: 255 }
  validates :text, presence: true, length: { minimum: 5, maximum: 1000 }

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
        Tag.where(name: name.strip).first_or_create!
    end
  end
  
  def all_tags
    self.tags.map(&:name).join(", ")
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).posts
  end

end
