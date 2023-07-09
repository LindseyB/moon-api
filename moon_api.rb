# frozen_string_literal: true

require 'bundler'
require_relative 'moon'

Bundler.require

class MoonApi < Sinatra::Base
  helpers do
    def halt_with_404_not_found
      halt 404, { message: "Not found" }.to_json
    end
  end

  before do
    content_type :json
  end

  # Return the current moon phase
  get '/' do
    Moon.new.to_json
  end

  # Return the details of a specific moon phase
  get '/phases/(:phase)' do
    Moon.new(phase: params[:phase].downcase.to_sym).to_json
  rescue Moon::InvalidPhase
    halt_with_404_not_found
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