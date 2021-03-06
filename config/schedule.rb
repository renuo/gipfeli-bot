# frozen_string_literal: true

require 'dalli'
cache = Dalli::Client.new((ENV['MEMCACHIER_SERVERS'] || '').split(','),
                          username: ENV['MEMCACHIER_USERNAME'],
                          password: ENV['MEMCACHIER_PASSWORD'],
                          failover: true,
                          socket_timeout: 1.5,
                          socket_failure_delay: 0.2)
every 1.day, at: '09:50' do
  cache.set('list', nil)
end
