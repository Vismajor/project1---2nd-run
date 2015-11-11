class User < ActiveRecord::Base
  ROLES = %i[admin user]
  mount_uploader :profile_picture, AvatarUploader
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  def role?(role_to_compare)
    self.role.to_s == role_to_compare.to_s
  end

  acts_as_messageable
    def mailboxer_name
      self.name
    end

    def mailboxer_email(object)
      self.email
    end

end
