class Comment
  include Mongoid::Document
  include Mongoid::ActiveRecordBridge
  include Mongoid::Timestamps

  field :body, type: String

  belongs_to_record :post
  belongs_to_record :user
  
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
