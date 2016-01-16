module ApplicationHelper
  def markdown(text)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render text).html_safe
  end 

  def up_vote_link_classes(post)
    current_user.voted(post) && current_user.voted(post).up_vote? ? 'voted' : ''
  end

  def down_vote_link_classes(post)
    current_user.voted(post) && current_user.voted(post).down_vote? ? 'voted' : ''
  end
end
