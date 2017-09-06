module SlackGipfeliBot
  module Commands
    class Calculate < SlackRubyBot::Commands::Base
			require 'dalli'
			cache = Dalli::Client.new((ENV["MEMCACHIER_SERVERS"] || "").split(","),
													{:username => ENV["MEMCACHIER_USERNAME"],
													 :password => ENV["MEMCACHIER_PASSWORD"],
													 :failover => true,
													 :socket_timeout => 1.5,
													 :socket_failure_delay => 0.2
													})

      command 'add' do |client, data, _match|
        list = File.open('gipfeli_list', 'a')

        wish = _match.to_s[12..-1]
        if wish.nil?
          client.say(channel: data.channel, text: 'You need to tell me your order! (e.g. \'add gipfeli\'')
        else
          client.say(channel: data.channel, text: "Your order of '#{wish}' has been added to the list.")
					cache.set('list', "#{cache.get('list')} \n #{wish}")	
					client.say(channel: data.channel, text: cache.get('list'))
          #list.write("#{wish}\n")
        end

        list.close
      end
    end
  end
end
