class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name, :role, :avatar, :avatar_cache, :email_favorites

  mount_uploader :avatar, AvatarUploader

  def admin?
    role == 'admin'
  end

  def moderator?
    role == 'moderator'
  end
  
  def favorited(post)
    favorites.where(post_id: post.id).first
  end

  def voted(post)
    votes.where(post_id: post.id).first
  end

  def self.top_rated
    self.select('users.*') #select all user attributes
      .select('COUNT(DISTINCT comments.id) AS comments_count') #count comments
      .select('COUNT(DISTINCT posts.id) AS posts_count') #count posts
      .select('COUNT(DISTINCT comments.id) + COUNT(DISTINCT posts.id) AS rank') #add for rank
      .joins(:posts)
      .joins(:comments)
      .group('users.id')
      .order('rank DESC')
  end
end
