# frozen_string_literal: true

require 'json'
SuckerPunch.logger = Logger.new('sucker_punch.log')

class RequestJob
  include SuckerPunch::Job

  def perform(url)
    command = "docker run --rm wpscanteam/wpscan-v3 --no-banner --url #{url} -f json"
    output = JSON.parse(`#{command}`)
    File.open("#{Time.now.to_i}.json", 'w') do |f|
      f.write(output.to_json)
    end
  end
end
