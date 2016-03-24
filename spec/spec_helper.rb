require "codeclimate-test-reporter"
CodeClimate::TestReporter.start
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rlm_logistics'
require 'support/vcr_support'

def xml_fixture(type)
  File.read( fixture_path(type) )
end

def fixture_path(type)
  File.expand_path("spec/fixtures/#{type}.xml")
end

RSpec.configure do |config|
  config.before(:each) do

    RlmLogistics.config do |r|
      r.username      = "XXUSER"
      r.password      = "XXKEY"
      r.endpoint_path = "TESTServices"
      r.company       = 90
    end

  end
end
