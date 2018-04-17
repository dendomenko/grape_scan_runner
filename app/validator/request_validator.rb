# frozen_string_literal: true

require 'json-schema'

# Wpscan arguments validator and parser
class RequestValidator
  class << self
    include Schema

    def check_json_params(params)
      if (VALID_REQUEST_SCHEMA[:properties].keys & params.keys.map(&:to_sym)).size != params.keys.size
        raise 'Wrong arguments'
      end
      JSON::Validator.validate!(VALID_REQUEST_SCHEMA, params.to_json)
    end

    def parse_params(params)
      params.map { |key, value| value.is_a?(TrueClass) ? "--#{key}" : "--#{key} #{value}" }
            .join(' ')
    end
  end
end
