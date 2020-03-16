lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "kitchen/transport/dropbear_version.rb"

Gem::Specification.new do |spec|
  spec.name          = "kitchen-dropbear"
  spec.version       = Kitchen::Transport::DROPBEAR_VERSION
  spec.authors       = ["Thomas Heinen"]
  spec.email         = ["theinen@tecracer.de"]
  spec.summary       = "Test Kitchen transport using Dropbear"
  spec.description   = "Test Kitchen transport using Dropbear"
  spec.homepage      = "https://github.com/tecracer-theinen/kitchen-dropbear"
  spec.license       = "Apache-2.0"

  spec.files         = Dir["LICENSE", "lib/**/*"]
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.3"

  spec.add_dependency "test-kitchen", ">= 1.16", "< 3.0"

  spec.add_development_dependency "bundler", ">= 1.16"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "yard", "~> 0.9"
end
