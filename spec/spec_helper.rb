require "rack/test"
require "rspec"

ENV["RACK_ENV"] = "test"

require File.expand_path "../../moon_api.rb", __FILE__

RSpec.configure do |config|
  config.include Rack::Test::Methods
end