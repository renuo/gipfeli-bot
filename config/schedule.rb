# frozen_string_literal: true
# frozen_string_literal: true

# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
#

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
