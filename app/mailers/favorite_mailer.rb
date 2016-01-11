class FavoriteMailer < ActionMailer::Base
  default from: "me@see.com"

  def new_comment(user,post,comment)
    headers["Message_ID"] = "<comments/#{comment.id}@prasmalla-bloccit"
    headers["In-Reply-To"] = "<post/#{post.id}@prasmalla-bloccit"
    headers["References"] = "<post/#{post.id}@prasmalla-bloccit"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end  
end
