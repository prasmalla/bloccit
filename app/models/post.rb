class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user, dependent: :destroy
  belongs_to :topic
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy

  attr_accessible :body, :title, :user, :role, :topic, :image, :image_cache, :created_at

  default_scope { order('rank DESC') }
  scope :visible_to, -> (user) { user ? scoped : joins(:topic).where('topics.public' => true) }

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true

  mount_uploader :image, ImageUploader

  def up_votes
    votes.where(value: 1).count
  end

  def down_votes
    votes.where(value: -1).count
  end

  def points
    votes.sum(:value)
  end

  def update_rank
    age_in_days = (created_at - Time.new(1970,1,1)) / (60 * 60 * 24) # 1 day in seconds
    new_rank = points + age_in_days

    update_column(:rank, new_rank)
  end

  def create_vote
    user.votes.create(value: 1, post: self)
  end  

  def save_with_initial_vote
    ActiveRecord::Base.transaction do
      self.save
      create_vote
    end
  end    
end
