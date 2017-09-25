# frozen_string_literal: true

module SlackGipfeliBot
  module Commands
    class Add < SlackRubyBot::Commands::Base
      require 'dalli'
      cache = Dalli::Client.new((ENV['MEMCACHIER_SERVERS'] || '').split(','),
                                username: ENV['MEMCACHIER_USERNAME'],
                                password: ENV['MEMCACHIER_PASSWORD'],
                                failover: true,
                                socket_timeout: 1.5,
                                socket_failure_delay: 0.2)

      command 'add' do |client, data, _match|
        wish = _match.to_s[12..-1]
        if wish.nil?
          client.say(channel: data.channel, text:
              'You need to tell me your order! (e.g. \'add gipfeli\')')
        else
          client.say(channel: data.channel, text:
              "Your order of '#{wish}' has been added to the list.")
          cache.set('list', "#{cache.get('list')} \n #{wish}", 36_000)
        end
      end
    end
  end
end
