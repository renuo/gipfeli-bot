# frozen_string_literal: true

module SlackGipfeliBot
  module Commands
    class Remind < SlackRubyBot::Commands::Base
      command 'remind' do |client, data, _match|
        Thread.new do
          client.say(channel: ENV['SLACK_FOOD_CHANNEL_ID'], text:
              "*Someone is about to go buy Gipfeli!*\n"\
              '*Place your orders in the next ~5 minutes or it\'s too late!*')
          sleep(5 * 60)
          client.say(channel: data.channel, text:
              '*You waited long enough, you can go buy them now! (Don\'t forget to clear!)*')
        end
      end
    end
  end
end
