class CreatePostFromFileJob
  include Sidekiq::Job
  sidekiq_options retry: false

  def perform(content, user_id)
    posts = content.split("\n\n")

    posts.each do | post |
      CreatePostJob.perform_async(post, user_id)
    end
  end
end
