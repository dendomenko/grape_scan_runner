require 'spec_helper'

describe 'Wpscan API' do
  include Rack::Test::Methods

  def app
    Wpscan::API
  end

  context 'GET /api/v1/update' do
    it 'returns 200' do
      get '/api/v1/update'
      expect(JSON.parse(last_response.body)).to eq({ 'status' => "Wpscan database update started" })
      expect(last_response.status).to eq(200)
    end
  end

  context 'POST /api/v1/wpscan' do
    it 'sends empty request' do
      post 'api/v1/scan'
      expect(JSON.parse(last_response.body)).to eq({"error"=>"url is missing"})
      expect(last_response.status).to eq(400)
    end

    it 'sends empty request' do
      post 'api/v1/scan', {url: 'test.com'}
      expect(JSON.parse(last_response.body)).to eq({"status" => "The request is being processed"})
      expect(last_response.status).to eq(400)
    end
  end
end
