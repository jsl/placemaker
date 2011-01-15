# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{placemaker}
  s.version = "0.0.1.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Justin Leitgeb"]
  s.date = %q{2009-05-20}
  s.description = %q{Ruby interface for the Yahoo Placemaker API}
  s.email = %q{justin@stackbuilders.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]


  s.files = ["lib/placemaker/client.rb", "lib/placemaker/coordinates.rb", "lib/placemaker/document.rb", "lib/placemaker/extents.rb",
             "lib/placemaker/location.rb", "lib/placemaker/place_details.rb", "lib/placemaker/xml_helper.rb", "lib/placemaker/xml_parser.rb", "lib/placemaker.rb", "LICENSE", "placemaker.gemspec",
             "Rakefile", "README.rdoc", "spec/fixtures/xml_rss_feed_result.xml", "spec/placemaker/client_spec.rb", "spec/placemaker/coordinates_spec.rb",
             "spec/placemaker/document_spec.rb", "spec/placemaker/extents_spec.rb", "spec/placemaker/location_spec.rb",
             "spec/placemaker/place_details_spec.rb", "spec/placemaker/xml_parser_spec.rb", "spec/spec_helper.rb"]

  s.has_rdoc = true
  s.homepage = %q{http://github.com/jsl/placemaker}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Ruby interface over the Yahoo Placemaker API}
  
  s.test_files = ["spec/fixtures/xml_rss_feed_result.xml", "spec/placemaker/client_spec.rb", "spec/placemaker/coordinates_spec.rb", 
    "spec/placemaker/document_spec.rb", "spec/placemaker/extents_spec.rb", "spec/placemaker/location_spec.rb", 
    "spec/placemaker/place_details_spec.rb", "spec/placemaker/xml_parser_spec.rb", "spec/spec_helper.rb"]

  s.extra_rdoc_files = [ "README.rdoc" ]
  
  s.rdoc_options += [
    '--title', 'Placemaker',
    '--main', 'README.rdoc',
    '--line-numbers',
    '--inline-source'
   ]

  %w[ curb nokogiri ].each do |dep|
    s.add_dependency(dep)
  end

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2
  end
end
