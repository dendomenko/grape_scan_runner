# frozen_string_literal: true

require 'json'
require 'net/http'

# A job which just runs wpscan and sends a result to callback URI
class RequestJob
  include SuckerPunch::Job

  def perform(command_params)
    command = "wpscan --no-update --no-banner #{command_params} -f json"
    output = JSON.parse(`#{command}`)
    File.open("public/responses/#{Time.now.to_i}.json", 'w') do |f|
      f.write(output.to_json)
    end
    send_callback(output)
  rescue JSON::ParserError => e
    puts e.to_json
    send_callback({ errors: e })
  end

  private

  def send_callback(data)
    uri = URI('http://localhost:3000/api/v1/callback')
    Net::HTTP.post_form(uri, data)
  end
end
