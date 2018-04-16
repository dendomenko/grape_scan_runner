# frozen_string_literal: true

require 'json-schema'

# Wpscan arguments validator and parser
class RequestValidator
  class << self
    include Schema

    def check_json_params(json_data)
      JSON::Validator.validate!(VALID_REQUEST_SCHEMA, json_data)
    end

    def parse_params(params)
      params.map { |key, value| value.is_a?(TrueClass) ? "--#{key}" : "--#{key} #{value}" }
            .join(' ')
    end
  end
end
