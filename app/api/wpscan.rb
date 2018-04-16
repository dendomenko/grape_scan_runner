# frozen_string_literal: true

module Wpscan
  class API < Grape::API
    version 'v1', using: :header, vendor: 'wpscan'
    format :json
    prefix :api

    resource :v1 do
      desc 'Return a public timeline.'
      params do
        requires :url, type: String
      end
      post :scan do
        RequestJob.perform_async params[:url]
        { status: 'The request is being processed' }
      end
    end
  end
end
