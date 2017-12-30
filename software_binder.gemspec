
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "software_binder/version"

Gem::Specification.new do |spec|
  spec.name          = "software_binder"
  spec.version       = SoftwareBinder::VERSION
  spec.authors       = ["Hoon Lee"]
  spec.email         = ["yl.hoony@gmail.com"]

  spec.summary       = %q{CLI Program to check software cateogy and lists from Capterra}
  spec.description   = %q{With Software Binder, you can get the software list by category from Capterra.}
  spec.homepage      = "https://github.com/ylhoony/software-binder-cli-app"
  spec.license       = "MIT"
  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = "software_binder"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.11"
  spec.add_runtime_dependency "nokogiri", "~> 1.8"
  spec.add_runtime_dependency "require_all"
end
