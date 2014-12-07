class Topic < ActiveRecord::Base
  has_many :posts
  attr_accessible :description, :name, :public

  paginates_per 10
end
