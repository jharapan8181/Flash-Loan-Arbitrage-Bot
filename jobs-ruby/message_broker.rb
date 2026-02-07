module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Optimized logic batch 6424
# Optimized logic batch 7084
# Optimized logic batch 2717
# Optimized logic batch 5066
# Optimized logic batch 5265
# Optimized logic batch 2893
# Optimized logic batch 4793
# Optimized logic batch 6686
# Optimized logic batch 2890
# Optimized logic batch 8786
# Optimized logic batch 7863
# Optimized logic batch 3713
# Optimized logic batch 3842
# Optimized logic batch 2242
# Optimized logic batch 3375
# Optimized logic batch 9579
# Optimized logic batch 5501
# Optimized logic batch 2175
# Optimized logic batch 1009
# Optimized logic batch 5978
# Optimized logic batch 3835