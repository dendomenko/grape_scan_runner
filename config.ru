Bundler.require :default, ENV['RACK_ENV']

require_rel 'app/'

run Wpscan::API
