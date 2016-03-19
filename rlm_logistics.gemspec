# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rlm_logistics/version'

Gem::Specification.new do |spec|
  spec.name          = "rlm_logistics"
  spec.version       = RlmLogistics::VERSION
  spec.authors       = ["Justin Grubbs"]
  spec.email         = ["justin@jgrubbs.net"]

  spec.summary       = %q{Ruby API wrapper for RLM logistics}
  spec.description   = %q{Ruby API wrapper for RLM logistics}
  spec.homepage      = "https://github.com/jGRUBBS/rlm_logistics"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "active_record-remote", "~> 0.0.1"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake",    "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "debugger"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
end
