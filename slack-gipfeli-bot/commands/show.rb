# frozen_string_literal: true

module SlackGipfeliBot
  module Commands
    class Calculate < SlackRubyBot::Commands::Base
      require 'dalli'
      cache = Dalli::Client.new((ENV['MEMCACHIER_SERVERS'] || '').split(','),
                                username: ENV['MEMCACHIER_USERNAME'],
                                password: ENV['MEMCACHIER_PASSWORD'],
                                failover: true,
                                socket_timeout: 1.5,
                                socket_failure_delay: 0.2)
      command 'show' do |client, data, _match|
        if cache.get('list').nil?
          text = 'There are no orders currently'
        else
          client.say(channel: data.channel, text: '*Here are the current orders:*')
          text = cache.get('list')
        end
        client.say(channel: data.channel, text: text)
      end
    end
  end
end
