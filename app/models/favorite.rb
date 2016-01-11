class Favorite < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  #FIX cant mass assign workaround
  attr_accessible :post, :user
end
