sidekiq_config = { url: "redis://#{ENV['REDIS_HOST']}:6379/0" }
Sidekiq.configure_server do |config|
  config.redis = sidekiq_config
end
Sidekiq.configure_client do |config|
  config.redis = sidekiq_config
end
