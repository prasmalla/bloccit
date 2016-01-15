class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  attr_accessible :description, :name, :public
  scope :visible_to, -> (user) { user ? all : where(public: true) }

  paginates_per 10
end
