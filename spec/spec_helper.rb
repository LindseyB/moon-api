# frozen_string_literal: true

require 'rack/test'
require 'rspec'
require 'timecop'
require 'pry'

ENV['RACK_ENV'] = 'test'

require File.expand_path '../moon_api.rb', __dir__

RSpec.configure do |config|
  config.include Rack::Test::Methods
end
