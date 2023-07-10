# frozen_string_literal: true

source 'https://rubygems.org'

ruby '~> 3.2.2'

gem 'puma'
gem 'sinatra'

gem 'eventmachine', '~> 1.0.0.beta.4.1' if RUBY_PLATFORM.match?(/win32/)

group :test do
  gem 'rack-test'
  gem 'rspec'
  gem 'rubocop', require: false
  gem 'rubocop-rspec', require: false
  gem 'timecop'
end

group :development do
  gem 'pry'
  gem 'rake'
end
