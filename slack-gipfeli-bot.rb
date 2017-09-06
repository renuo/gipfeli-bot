# frozen_string_literal: true
require 'slack-ruby-bot'
require 'slack-gipfeli-bot/commands/add'
require 'slack-gipfeli-bot/bot'

begin
  ENV.update YAML.load_file('config/application.yml')
rescue
  {}
end
