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
				if cache.get('list') != nil 
					cache.set('list', nil) 
					client.say(channel: data.channel, text: 'The list has been cleared. Now go buy some gipfelis!')
					client.say(channel: 'C6Y8B21ND', text: 'Someone is on their way to buy gipfelis. Your order should arrive in the break room or kitchen within the next minutes.')
				else
					client.say(channel: data.channel, text: 'There are no orders yet!')
				end
      end
    end
  end
end
