# frozen_string_literal: true

require 'bundler'
require_relative 'moon'

Bundler.require

class MoonApi < Sinatra::Base
  before do
    content_type :json
  end

  # Return the current moon phase
  get '/' do
    Moon.new.to_json
  end

  # Return the details of a specific moon phase
  get '/phases/(:phase)' do
    Moon.new(phase: params[:phase].to_sym).to_json
  end

  # Return the moon phase for a specific date as a unix epoch timestamp
  get '/date/(:date)' do
    Moon.new(epoch: Time.at(params[:date].to_i)).to_json
  end
end