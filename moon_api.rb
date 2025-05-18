# frozen_string_literal: true

require 'bundler'
require_relative 'moon'

Bundler.require

# The MoonApi class is a Sinatra app that provides a RESTful API for the Moon
class MoonApi < Sinatra::Base
  set :protection, except: :json_csrf

  helpers do
    def halt_with_404_not_found
      halt 404, { message: 'Not found' }.to_json
    end
  end

  before do
    content_type :json
  end

  # Return the current moon phase
  get '/:format?' do
    Moon.new.to_json
  end

  get '/current:format?' do
    # Return the current moon phase
    Moon.new.to_json
  end

  get '/favicon.ico' do
    # set favicon to the current moon phase
    redirect to "/#{Moon.new.phase}.ico"
  end

  # Return the details of a specific moon phase
  get '/phases/(:phase):format?' do
    Moon.new(phase: params[:phase].downcase.to_sym).to_json
  rescue Moon::InvalidPhase
    halt_with_404_not_found
  end

  # Returns all the moon phases
  get '/phases:format?' do
    phases = []
    Moon::ASSOCIATIONS.keys.map do |phase|
      phases << Moon.new(phase:)
    end
    phases.to_json
  end

  # Return the moon phase for a specific date as a unix epoch timestamp
  get '/date/(:date):format?' do
    # Just check if it's a series of digits
    if params[:date].match?(/\d+/)
      Moon.new(epoch: Time.at(params[:date].to_i)).to_json
    else
      halt_with_404_not_found
    end
  end
end
