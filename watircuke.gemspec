# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{watircuke}
  s.version = "0.4.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Rich Downie", "Marcos Piccinini", "Thiago Pradi"]
  s.date = %q{2009-06-19}
  s.email = %q{x@nofxx.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    ".gitignore",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "cucumber.yml",
     "features/ajax.feature",
     "features/sample.feature",
     "features/support/env.rb",
     "features/support/paths.rb",
     "lib/watircuke.rb",
     "lib/steps/watircuke_en.rb",
     "lib/steps/watircuke_pt.rb",
     "lib/steps/webratcuke_en.rb",
     "spec/spec_helper.rb",
     "spec/watircuke_spec.rb",
     "watircuke.gemspec"
  ]
  s.homepage = %q{http://github.com/tchandy/watircuke}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{Watir steps for cucumber}
  s.test_files = [
    "spec/watircuke_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
