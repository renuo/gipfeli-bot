# frozen_string_literal: true

source 'https://rubygems.org'
ruby File.read('.ruby-version').strip

gem 'celluloid-io'
gem 'dalli'
gem 'dotenv'
gem 'figaro'
gem 'puma'
gem 'ruby-cache', '~> 0.3.0'
gem 'sinatra'
gem 'slack-ruby-bot', git: 'https://github.com/dblock/slack-ruby-bot.git'
gem 'whenever', require: false

group :development, :test do
  gem 'foreman'
  gem 'rake'
  gem 'rspec'
end
