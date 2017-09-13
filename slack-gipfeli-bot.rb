# frozen_string_literal: true

require 'slack-ruby-bot'
require 'slack-gipfeli-bot/bot'
require 'slack-gipfeli-bot/commands/add'
require 'slack-gipfeli-bot/commands/show'
require 'slack-gipfeli-bot/commands/clear'
require 'slack-gipfeli-bot/commands/help'
begin
  ENV.update YAML.load_file('config/application.yml')
rescue
  {}
end
