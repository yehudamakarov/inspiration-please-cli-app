
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "inspiration_please/version"

Gem::Specification.new do |spec|
  spec.name          = "inspiration-please"
  spec.version       = InspirationPlease::VERSION
  spec.authors       = ["Yehuda Makarov"]
  spec.email         = ["yehudamakarov@gmail.com"]

  spec.summary       = %q{This gem brings you the day in Jewish History, or a short daily thought, in order to uplift the soul.}
  spec.homepage      = "https://github.com/yehudamakarov/yehudamakarov-cli-inspirationplease"
  spec.license       = "MIT"


  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end.concat [
    "lib/inspiration_please.rb",
    "lib/inspiration_please/cli.rb",
    "lib/inspiration_please/date_page.rb"
  ]
  spec.bindir        = "exe"
  spec.executables   = ["inspiration-please"]
  spec.require_paths = ["lib", "lib/inspiration_please"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "nokogiri"
end
