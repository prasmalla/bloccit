 require 'rails_helper' 

 describe User do 
  include TestFactories

  describe "#favorited(post)" do
    before do      
      @post = associated_post
      @user = authenticated_user
    end
      
    it "returns `nil` if the user has not favorited the post" do
      expect( @user.favorited(@post) ).to be_nil
    end

    it "returns the appropriate favorite if it exists" do
      favorite = Favorite.create(user: @user, post: @post)
      expect( favorite ).to eq( @user.favorited(@post) )
    end
  end
end
