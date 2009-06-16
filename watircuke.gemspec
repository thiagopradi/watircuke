# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{watircuke}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Marcos Piccinini"]
  s.date = %q{2009-06-16}
  s.email = %q{x@nofxx.com}
  s.extra_rdoc_files = [
    "README"
  ]
  s.files = [
    ".gitignore",
     "README",
     "Rakefile",
     "VERSION",
     "features/sample.feature",
     "features/step_definitions/assertions.rb",
     "features/step_definitions/buttons.rb",
     "features/step_definitions/checkboxes.rb",
     "features/step_definitions/javascript.rb",
     "features/step_definitions/links.rb",
     "features/step_definitions/pages.rb",
     "features/step_definitions/radio_buttons.rb",
     "features/step_definitions/select_lists.rb",
     "features/step_definitions/sleep.rb",
     "features/step_definitions/spans.rb",
     "features/step_definitions/text_fields.rb",
     "features/step_definitions/urls.rb",
     "features/support/env.rb",
     "features/support/paths.rb",
     "lib/watircuke.rb",
     "lib/webratcuke.rb",
     "spec/spec_helper.rb",
     "spec/watircuke_spec.rb"
  ]
  s.homepage = %q{http://github.com/nofxx/watircuke}
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
