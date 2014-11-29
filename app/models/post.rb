class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  
  attr_accessible :body, :title, :user_id

  default_scope { order('created_at DESC') }
end
