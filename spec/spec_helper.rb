# coding: utf-8
require 'webmock/rspec'
WebMock.disable_net_connect!
require 'vcr'

VCR.configure do |c|  
  c.cassette_library_dir = File.expand_path(File.dirname(__FILE__) + '/fixtures')
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = true
  c.default_cassette_options = {
    :match_requests_on => [:method,
      VCR.request_matchers.uri_without_param(:timestamp)]
  }
end

require File.expand_path(File.dirname(__FILE__) + '/../lib/dmm/api')
config = YAML.load_file(File.dirname(__FILE__)+'/config.yml')

Dmm::Api.configure do |options|
  options[:api_id] = config["api_id"]
  options[:affiliate_id] = config["affiliate_id"]
  options[:site] = config["site"]
end
