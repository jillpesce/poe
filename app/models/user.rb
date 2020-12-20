class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :posts, dependent: :destroy
    has_many :followers, :class_name => 'Followings', :foreign_key => 'person_id'
    has_many :following, :class_name => 'Followings', :foreign_key => 'follower_id' 
    has_one_attached :avatar
    validates :username, presence: true
    validates :full_name, presence: true
    validates :email, presence: true
    validates :password, presence: true

    validate :avatar_format

def resize_image
    resized_image = MiniMagick::Image.read(avatar.download)
    resized_image = resized_image.resize "200x200"
    v_filename = avatar.filename
    v_content_type = avatar.content_type
    avatar.purge
    avatar.attach(io: File.open(resized_image.path), filename:  v_filename, content_type: v_content_type)
end

private
def avatar_format
 return unless avatar.attached?
 if avatar.blob.content_type.start_with? 'image/'
   if avatar.blob.byte_size > 10.megabytes
     errors.add(:avatar, 'size needs to be less than 10MB')
     avatar.purge
   else
     resize_image
   end
  else
    avatar.purge
    errors.add(:avatar, 'needs to be an image')
  end
end

    def user_params
      params.require(:user).permit(:email_address, :password, :avatar)
    end

end
