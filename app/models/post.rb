class Post < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }
  belongs_to :user
  has_many :comments
  mount_uploader :picture, AvatarUploader
  acts_as_votable
  self.per_page = 9
  scope :ordered , -> { order('posts.created_at DESC') }
end
