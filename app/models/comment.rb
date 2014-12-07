class Comment
  include Mongoid::Document
  include Mongoid::ActiveRecordBridge
  include Mongoid::Timestamps

  field :body, type: String

  belongs_to_record :post
  belongs_to_record :user
  
  validates_presence_of :user_id
  validates :body, length: { minimum: 5 }, presence: true

  #fix pundit/mongoid no method error
  #https://github.com/mongoid/mongoid/issues/2661
  def model_name
    self.class.model_name
  end
  
end
