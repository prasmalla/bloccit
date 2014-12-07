class Comment
  include Mongoid::Document
  include Mongoid::ActiveRecordBridge

  field :body, type: String

  belongs_to_record :post
  belongs_to_record :user
  
  validates_presence_of :user_id
  validates :body, length: { minimum: 5 }, presence: true
  
end
