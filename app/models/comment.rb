class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  
  validates_presence_of :user_id
  validates :body, length: { minimum: 5 }, presence: true

  after_create :send_favorite_emails

  #fix pundit/mongoid no method error
  #https://github.com/mongoid/mongoid/issues/2661
  def model_name
    self.class.model_name
  end
  
  private

  def send_favorite_emails
    post.favorites.each do |favorite|
      FavoriteMailer.new_comment(favorite.user, post, self).deliver if should_receive_update_for?(favorite)
    end  
  end

  def should_receive_update_for?(favorite)
    user_id != favorite.user_id && favorite.user.email_favorites?
  end  
end
