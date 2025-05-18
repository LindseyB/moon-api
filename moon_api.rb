# frozen_string_literal: true

require 'bundler'
require_relative 'moon'

Bundler.require

# Enable CORS for all origins
before do
  response.headers['Access-Control-Allow-Origin'] = '*'
  response.headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, PATCH, DELETE, OPTIONS'
  response.headers['Access-Control-Allow-Headers'] = 'Content-Type, Authorization, Accept'
end

# Handle preflight requests
options '*' do
  200
end

# The MoonApi class is a Sinatra app that provides a RESTful API for the Moon
class MoonApi < Sinatra::Base
  helpers do
    def halt_with_404_not_found
      halt 404, { message: 'Not found' }.to_json
    end
  end

  before do
    content_type :json
  end

  # Return the current moon phase
  get '/' do
    Moon.new.to_json
  end

  get '/favicon.ico' do
    # set favicon to the current moon phase
    redirect to "/#{Moon.new.phase}.ico"
  end

  # Return the details of a specific moon phase
  get '/phases/(:phase)' do
    Moon.new(phase: params[:phase].downcase.to_sym).to_json
  rescue Moon::InvalidPhase
    halt_with_404_not_found
  end

  # Returns all the moon phases
  get '/phases' do
    phases = []
    Moon::ASSOCIATIONS.keys.map do |phase|
      phases << Moon.new(phase:)
    end
    phases.to_json
  end

  # Return the moon phase for a specific date as a unix epoch timestamp
  get '/date/(:date)' do
    # Just check if it's a series of digits
    if params[:date].match?(/\d+/)
      Moon.new(epoch: Time.at(params[:date].to_i)).to_json
    else
      halt_with_404_not_found
    end
  end
end
