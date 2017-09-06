module SlackGipfeliBot
  module Commands
    class Calculate < SlackRubyBot::Commands::Base

      command 'show' do |client, data, _match|
					if cache.get('list') == nil
						text = 'There are no orders currently'	
					else
						text = cache.get('list')
					end
        client.say(channel: data.channel, text: text)
      end

    end
  end
end
