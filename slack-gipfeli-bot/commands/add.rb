# frozen_string_literal: true

module SlackGipfeliBot
  module Commands
    class Calculate < SlackRubyBot::Commands::Base
      require 'dalli'
      cache = Dalli::Client.new((ENV['MEMCACHIER_SERVERS'] || '').split(','),
                                username: ENV['MEMCACHIER_USERNAME'],
                                password: ENV['MEMCACHIER_PASSWORD'],
                                failover: true,
                                socket_timeout: 1.5,
                                socket_failure_delay: 0.2)

      command 'add' do |client, data, _match|
        # list = File.open('gipfeli_list', 'a')
        cur_list, times, orders, new_order = cache.get('list'), [], [], match.to_s[12..-1]

        cur_list.split("\n").each do |item|
          times << item.match(/\d+x/).to_s
          orders << item.match(/ [\S\W]+/).to_s[1..-1]
        end

        index = orders.map(&:downcase).find_index(new.downcase)

        if new_order.nil?
          client.say(channel: data.channel, text: 'You need to tell me your order! (e.g. \'add gipfeli\')')
        elsif index
          times[index] = "#{times[index][0..-2].to_i + 1}x"
        else
          times << '1x'
          orders << new_order
          client.say(channel: data.channel, text: "Your order of '#{wish}' has been added to the list.")
          cache.set('list', times.zip(orders).map{|x| x.join(' ')}.join("\n"), 36_000)
        end
      end
    end
  end
end
end
