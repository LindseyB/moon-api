# frozen_string_literal: true

require 'spec_helper'

describe 'MoonApi' do
  def app
    MoonApi
  end

  describe '/' do
    it 'returns the current moon phase' do
      waxing_crescent_time = Time.local(2008, 9, 1, 12, 0, 0)
      Timecop.freeze(waxing_crescent_time) { get '/' }

      expect(last_response).to be_ok
      body = JSON.parse(last_response.body)

      expect(body['phase']).to eq 'waxing_crescent'
      expect(body['days']).to eq 1
      expect(body['emoji']).to eq '🌒'
      expect(body['association']).to eq 'setting intentions'
    end
  end

  describe '/favicon.ico' do
    it "redirects to the current moon phase's favicon" do
      waxing_crescent_time = Time.local(2008, 9, 1, 12, 0, 0)
      Timecop.freeze(waxing_crescent_time) { get '/favicon.ico' }

      expect(last_response).to be_redirect
      expect(last_response.headers['Location'].end_with?('/waxing_crescent.ico')).to be true
    end
  end

  describe '/phases/:phase' do
    it 'returns the details of a specific moon phase' do
      get '/phases/new'

      expect(last_response).to be_ok
      body = JSON.parse(last_response.body)

      expect(body['phase']).to eq 'new'
      expect(body['days']).to eq 0
      expect(body['emoji']).to eq '🌑'
      expect(body['association']).to eq 'new beginnings'
    end

    it 'is case insensitive' do
      get '/phases/NEW'

      expect(last_response).to be_ok
      body = JSON.parse(last_response.body)

      expect(body['phase']).to eq 'new'
      expect(body['days']).to eq 0
      expect(body['emoji']).to eq '🌑'
      expect(body['association']).to eq 'new beginnings'
    end

    it 'returns a 404 for an invalid phase' do
      get '/phases/invalid'

      expect(last_response).to be_not_found
    end
  end

  describe '/phases' do
    it 'returns all the moon phases' do
      get '/phases'

      expect(last_response).to be_ok
      body = JSON.parse(last_response.body)

      expect(body.length).to eq 8
      expect(body[0]['phase']).to eq 'new'
      expect(body[0]['days']).to eq 0
      expect(body[0]['emoji']).to eq '🌑'
      expect(body[0]['association']).to eq 'new beginnings'
    end
  end

  describe '/date/:date' do
    it 'returns the moon phase for a specific date' do
      get '/date/1535750400'

      expect(last_response).to be_ok
      body = JSON.parse(last_response.body)

      expect(body['phase']).to eq 'waning_gibbous'
      expect(body['days']).to eq 19
      expect(body['emoji']).to eq '🌖'
      expect(body['association']).to eq 'expressing gratitude'
    end

    it 'returns a 404 for an invalid date' do
      get '/date/invalid'

      expect(last_response).to be_not_found
    end
  end
end
