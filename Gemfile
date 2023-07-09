# frozen_string_literal: true
source "https://rubygems.org"

ruby "~> 3.2.2"

gem "sinatra"
gem "puma"

if RUBY_PLATFORM.match?(/win32/)
  gem "eventmachine", "~> 1.0.0.beta.4.1"
end

group :test do
  gem "rspec"
  gem "rack-test"
  gem "timecop", "~> 0.9.6"
end

group :development do
  gem "rake"
  gem "pry"
end

