class CreatePostJob
  include Sidekiq::Job
  sidekiq_options retry: false

  def perform(post, user_id)
    title, content, tags = post.split("\n")
    post = Post.create(title: title, content: content, user_id: user_id)

    post.add_tags(tags) unless tags.blank?
  end
end
