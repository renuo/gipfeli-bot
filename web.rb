# frozen_string_literal: true

require 'sinatra'
require 'slack-gipfeli-bot'

module SlackGipfeliBot
  class Web < Sinatra::Base
    get '/' do
      'Gipfeli Bot is up!'
    end
  end
end
