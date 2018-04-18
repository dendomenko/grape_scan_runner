require 'rubygems'
require 'require_all'

require 'rack/test'
require 'net/http'
require 'spec_helper'
require 'capybara/rspec'
require 'sucker_punch'

require 'grape'
require 'json'

require_relative '../app/api/wpscan.rb'
require_relative '../app/jobs/update_job.rb'
require_relative '../app/jobs/request_job.rb'
require_relative '../app/validator/schema.rb'
require_relative '../app/validator/request_validator.rb'

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation

  config.mock_with :rspec
  config.expect_with :rspec
  config.raise_errors_for_deprecations!
end

Capybara.configure do |config|
  config.app = Wpscan::API.new
  config.server_port = 9293
end