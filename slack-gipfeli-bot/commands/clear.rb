module SlackGipfeliBot
  module Commands
    class Clear< SlackRubyBot::Commands::Base
      command 'clear' do |client, data, _match|
				if File.file?('gipfeli_list')
					File.delete('gipfeli_list') 
					client.say(channel: data.channel, text: 'The list has been cleared. Now go buy some gipfelis!')
					client.say(channel: 'C6Y8B21ND', text: 'Someone is on their way to buy gipfelis. Your order should arrive in the break room or kitchen within the next minutes.')
				else
					client.say(channel: data.channel, text: 'There are no orders yet!')
				end
      end
    end
  end
end
