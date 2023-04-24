function redis --wraps='redis-server ~/.config/redis/redis.conf' --description 'alias redis=redis-server ~/.config/redis/redis.conf'
  redis-server ~/.config/redis/redis.conf $argv
        
end
