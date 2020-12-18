class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :posts, dependent: :destroy
    has_and_belongs_to_many :friends,
                            :class_name => "User",
                            :join_table => "users_friends",
                            :foreign_key => "user_id",
                            :association_foreign_key => "friend_id"

    validates :username, presence: true
    validates :full_name, presence: true
    validates :email, presence: true
    validates :password, presence: true

end
