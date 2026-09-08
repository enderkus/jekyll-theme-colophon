# frozen_string_literal: true

require_relative "lib/jekyll-theme-colophon/version"

Gem::Specification.new do |spec|
  spec.name          = "jekyll-theme-colophon"
  spec.version       = JekyllThemeColophon::VERSION
  spec.authors       = ["Ender Kuş"]
  spec.email         = ["ender@enderkus.com.tr"]

  spec.summary       = "A minimal, serif-typography personal blog theme for Jekyll."
  spec.description   = "Colophon is a minimal, single- and two-column personal " \
                        "blog theme for Jekyll: system-font serif typography, " \
                        "light/dark mode, RSS, and a ConvertKit signup form."
  spec.homepage      = "https://github.com/enderkus/jekyll-theme-colophon"
  spec.license       = "MIT"

  spec.metadata = {
    "bug_tracker_uri"   => "#{spec.homepage}/issues",
    "changelog_uri"     => "#{spec.homepage}/releases",
    "source_code_uri"   => spec.homepage,
    "plugin_type"       => "theme"
  }

  spec.files = `git ls-files -z`.split("\x0").select do |f|
    f.match(%r!^(_layouts|_includes|_sass|assets|lib|LICENSE|README)!i)
  end

  spec.required_ruby_version = ">= 2.7.0"

  spec.add_runtime_dependency "jekyll", ">= 3.7", "< 5.0"
  spec.add_runtime_dependency "jekyll-feed", "~> 0.12"
  spec.add_runtime_dependency "jekyll-sitemap", "~> 1.4"

  spec.add_development_dependency "bundler", ">= 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
end
