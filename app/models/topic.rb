class Topic < ActiveRecord::Base
  has_many :posts
  attr_accessible :description, :name, :public
end
