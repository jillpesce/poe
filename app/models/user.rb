class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_and_belongs_to_many :friends,
                            :class_name => "User",
                            :join_table => "users_friends",
                            :foreign_key => "user_id",
                            :association_foreign_key => "friend_id"
end
