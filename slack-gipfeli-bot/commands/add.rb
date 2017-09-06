module SlackGipfeliBot
  module Commands
    class Calculate < SlackRubyBot::Commands::Base
      command 'add' do |client, data, _match|
        list = File.open('gipfeli_list', 'a')

        wish = _match.to_s[12..-1]
        if wish.nil?
          client.say(channel: data.channel, text: 'You need to tell me your order! (e.g. \'add gipfeli\'')
        else
          client.say(channel: data.channel, text: "Your order of '#{wish}' has been added to the list.")
          list.write("#{wish}\n")
        end

        list.close
      end
    end
  end
end