# frozen_string_literal: true

require_relative "lib/csv_json_converter/version"

Gem::Specification.new do |spec|
  spec.name = "csv_json_converter"
  spec.version = CsvJsonConverter::VERSION
  spec.authors = ["alexoid1"]
  spec.email = ["alexzambra2610@gmail.com"]

  spec.summary = "This is a gem to covert csv to json string and vice versa"
  spec.description = "This gem transform a csv string in a json string."
  spec.homepage = "https://rubygems.org/gems/csv_json_converter"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"


  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["documentation_uri"] = "https://github.com/Alexoid1/csv_json_converter"
  spec.metadata["source_code_uri"] = "https://github.com/Alexoid1/csv_json_converter"
  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
