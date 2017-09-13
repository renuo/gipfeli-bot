module SlackGipfeliBot
  module Commands
    class Clear< SlackRubyBot::Commands::Base

      require 'dalli'
      cache = Dalli::Client.new((ENV["MEMCACHIER_SERVERS"] || "").split(","),
                                {:username => ENV["MEMCACHIER_USERNAME"],
                                 :password => ENV["MEMCACHIER_PASSWORD"],
                                 :failover => true,
                                 :socket_timeout => 1.5,
                                 :socket_failure_delay => 0.2
                                })
      command 'clear' do |client, data, _match|
        if cache.get('list') == nil
          info_text = 'There are no orders currently.'
        else
          list_text = cache.get('list')
          cache.set('list', nil)
          info_text = "*The list has been cleared. Now go buy some gipfelis!"\
                      "Here\'s your shopping list:*\n" + list_text
          client.say(channel: ENV["SLACK_FOOD_CHANNEL_ID"], text: '*Someone is on their way to buy gipfelis. Your order should arrive in the break room or kitchen within the next minutes.*')

        end
        client.say(channel: data.channel, text: info_text)
      end
    end
  end
end