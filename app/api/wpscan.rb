# frozen_string_literal: true

require 'pry'

module Wpscan
  class API < Grape::API
    version 'v1', using: :header, vendor: 'wpscan'
    format :json
    prefix :api

    resource :v1 do
      params do
        requires :url, type: String
      end
      post :scan do
        RequestValidator.check_json_params(params.to_json)
        RequestJob.perform_async(RequestValidator.parse_params(params))
        { status: 'The request is being processed' }
      rescue JSON::Schema::ValidationError => e
        { errors: e.to_json }
      end

      post :callback do
        puts params # just check response
        # TODO: add some logic
      end
    end
  end
end
