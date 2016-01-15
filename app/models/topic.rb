class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  attr_accessible :description, :name, :public

  scope :publicly_viewable, -> { where(public: true) }
  scope :privately_viewable, -> { where(public: false) }
  scope :visible_to, -> (user) { user ? all : publicly_viewable }

  paginates_per 10
end
