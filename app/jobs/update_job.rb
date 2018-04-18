# frozen_string_literal: true

require 'json'

# A job which just runs wpscan update
class UpdateJob
  include SuckerPunch::Job

  def perform
    `wpscan --update`
  end
end