# frozen_string_literal: true
require 'slack-ruby-bot'
require 'SlackGipfeliBot/bot'

begin
  ENV.update YAML.load_file('config/application.yml')
rescue
  {}
end
