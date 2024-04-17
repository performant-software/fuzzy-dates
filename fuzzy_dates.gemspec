require_relative 'lib/fuzzy_dates/version'

Gem::Specification.new do |spec|
  spec.name        = 'fuzzy_dates'
  spec.version     = FuzzyDates::VERSION
  spec.authors     = ['Performant Software Solutions']
  spec.email       = ['derek@performantsoftware.com']
  spec.homepage    = 'https://github.com/performant-software/fuzzy-dates'
  spec.summary     = 'Summary of FuzzyDates.'
  spec.description = 'Description of FuzzyDates.'
  spec.license     = 'MIT'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  end

  spec.add_dependency 'rails', '>= 6.0.3.2', '< 8'
  spec.add_dependency 'resource_api'
end
