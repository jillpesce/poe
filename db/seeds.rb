# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def seed_users
    user_id = 0
    10.times do 
      User.create(
        full_name: "test#{user_id}",
        email: "test#{user_id}@test.com",
        username: "test#{user_id}username",
        password: '123456'
      )
      user_id = user_id + 1
    end
  end
  
  
  def seed_tags
    tags = ['Arts', 'Freestyle', 'Imagery', 'Funny', 'Rhyming', 'Sonnet', 'Verse']
  
    tags.each do |name|
      Tag.create(name: name)
    end
  end
  
  def seed_posts
    users = User.all
  
     users.each do |user|
      5.times do
        Post.create(
          author: Faker::Lorem.sentences[0], 
          text: Faker::Lorem.sentences[0], 
          user: user
        )
      end
    end
  end
  
  seed_users
  seed_tags
  seed_posts