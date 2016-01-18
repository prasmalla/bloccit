FactoryGirl.define do 
  factory :comment do
    body "New comment."
    user
    post
    
    after(:build) do |comment|
      comment.class.skip_callback(:create, :after, :send_favorite_emails)
    end
  end
end