# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

require_relative "lib/foreman_functionality_fix/version"

Gem::Specification.new do |s|
  s.name = "foreman_functionality_fix"
  s.version = ForemanFunctionalityFix::VERSION
  s.authors = ["Vladimir Savchenko"]
  s.email = ["voldmir@mail.ru"]
  s.description = "Plugin for fix Foreman."
  s.extra_rdoc_files = ["README.md"]
  s.files = Dir["{app,lib,config,locale}/**/*"] + ["README.md"]
  s.homepage = "https://github.com/voldmir/foreman_functionality_fix"
  s.license = "GPL-3.0"
  s.summary = "Plugin fix."
  s.add_runtime_dependency "deface"
  s.metadata["rubygems_mfa_required"] = "true"
  s.required_ruby_version = ">= 2.5.0"
end
