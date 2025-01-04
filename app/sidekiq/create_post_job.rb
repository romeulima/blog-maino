class CreatePostJob
  include Sidekiq::Job
  sidekiq_options retry: false

  def perform(post, user_id)
    title, content = post.split("\n")
    puts title
    puts content
    puts user_id
    post = Post.create(title: title, content: content, user_id: user_id)
  end
end
