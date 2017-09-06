# frozen_string_literal: true
require 'sinatra'
require 'slack-gipfeli-bot'

module SlackGipfeliBot
  class Web < Sinatra::Base
    get '/' do
      'gipfeli'
    end
  end
end