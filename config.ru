Bundler.require :default, ENV['RACK_ENV']

require_rel 'api/'
require_rel 'jobs/'

run Wpscan::API
