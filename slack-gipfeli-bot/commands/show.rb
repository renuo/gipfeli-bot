module SlackGipfeliBot
  module Commands
    class Calculate < SlackRubyBot::Commands::Base

      command 'show' do |client, data, _match|
					if !File.file?('gipfeli_list') || File.read('gipfeli_list').empty?
						text = 'There are no orders currently'	
					else
						text = File.read('gipfeli_list') 
					end
        client.say(channel: data.channel, text: text)
      end

    end
  end
end
