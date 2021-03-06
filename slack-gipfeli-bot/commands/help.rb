# frozen_string_literal: true

module SlackGipfeliBot
  module Commands
    class Help < SlackRubyBot::Commands::Base
      command 'help' do |client, data, _match|
        text = "
					add [Item name] --> add a new item to the list \n
					show --> show all items on current list \n
					clear --> empty the list \n
					remind --> reminds people to place orders
				"
        client.say(channel: data.channel, text: text)
      end
    end
  end
end
