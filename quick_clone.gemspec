# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'quick_clone/version'

Gem::Specification.new do |spec|
  spec.name          = "quick_clone"
  spec.version       = QuickClone::VERSION
  spec.authors       = ["Adan Alvarado"]
  spec.email         = ["adan.alvarado7@gmail.com"]
  spec.summary       = %q{Provide a simple way of cloning ActiveRecord Records}
  spec.homepage      = "https://github.com/aalvarado/quick_clone"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", ">= 4.0", "< 6.0"

  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "sqlite3", "~> 1.3"
end