$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rlm_logistics'

def xml_fixture(type)
  File.read( fixture_path(type) )
end

def fixture_path(type)
  File.expand_path("spec/fixtures/#{type}.xml")
end