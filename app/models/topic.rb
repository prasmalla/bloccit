class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  attr_accessible :description, :name, :public
  # scope :visible_to, -> (user) { user ? all : where(public: true) } RAILS4 all returns AR relation
  scope :visible_to, -> (user) { user ? scoped : where(public: true) } #rails3 use scoped
  paginates_per 10
end
