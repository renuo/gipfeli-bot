module SlackGipfeliBot
  module Commands
    class Calculate < SlackRubyBot::Commands::Base
      command 'NAME' do |client, data, _match|
        client.say(channel: data.channel, text: 'MSG')
      end
    end
  end
end