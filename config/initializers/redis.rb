if Rails.env.production?
  $redis = Redis.new(url: ENV["REDIS_URL"])
else
    redis_config = YAML.load_file(Rails.root.join('config', 'redis.yml')).fetch(Rails.env, {}).symbolize_keys
    $redis = Redis.new(redis_config)    
end
