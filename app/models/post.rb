class Post < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }
  belongs_to :user
  has_many :comments
  mount_uploader :picture, AvatarUploader
  acts_as_votable
end
