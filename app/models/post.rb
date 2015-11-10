class Post < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }
  belongs_to :user
  has_many :comments
  mount_uploader :picture, AvatarUploader
  acts_as_votable
end
