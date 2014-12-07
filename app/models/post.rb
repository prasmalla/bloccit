class Post < ActiveRecord::Base
  has_many_documents :comments#, dependent: :destroy
  belongs_to :user
  belongs_to :topic
  
  attr_accessible :body, :title, :user, :role, :topic, :image, :image_cache

  default_scope { order('created_at DESC') }

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true

  mount_uploader :image, ImageUploader
end
