Gem::Specification.new do |s|
  s.name = 'placemaker'
  s.version = "0.0.3"

  s.authors = 'Justin Leitgeb'

  s.summary = 'Ruby interface for the Yahoo Placemaker API'
  s.description = <<-EOS
    placemaker is a Ruby client for the Yahoo Placemaker API.  It uses
    the nokogiri and curb gems to help the user to efficiently query the
    Placemaker service and parse the XML response. 
  EOS

  s.email = 'justin@stackbuilders.com'
  s.extra_rdoc_files = [ "README.rdoc" ]

  require 'rake'
  s.files = FileList['lib/**/*.rb', '[A-Z]*', 'spec/**/*'].to_a

  s.has_rdoc = true
  s.homepage = 'http://github.com/jsl/placemaker'
  s.summary = 'Ruby interface over the Yahoo Placemaker API'

  s.license = 'MIT'

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

  s.test_files = Dir['spec/**/*_spec.rb']
end
