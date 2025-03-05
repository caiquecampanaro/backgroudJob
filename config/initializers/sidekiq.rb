Sidekiq.configure_server do |config|
    redis_config = YAML.load_file(Rails.root.join('config', 'redis.yml'))[Rails.env]
    config.redis = { host: redis_config['host'], port: redis_config['port'], db: redis_config['db'] || 0 }
  end
  
  Sidekiq.configure_client do |config|
    redis_config = YAML.load_file(Rails.root.join('config', 'redis.yml'))[Rails.env]
    config.redis = { host: redis_config['host'], port: redis_config['port'], db: redis_config['db'] || 0 }
  end
  