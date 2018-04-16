# frozen_string_literal: true

require 'json-schema'

class RequestValidator
  class << self

    include Schema

    def check_json_params(json_data)
      JSON::Validator.validate!(VALID_REQUEST_SCHEMA, json_data)
    end

    def parse_params(params)
      params.map do |key, value|
        if value.is_a? TrueClass
          "--#{key}"
        else
          "--#{key} #{value}"
        end
      end.join(' ')
    end
  end
end
