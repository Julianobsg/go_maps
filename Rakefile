require 'rubygems'
require 'rake'

ENV['RSPEC_COLOR'] = 'true'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "go_maps"
    gem.version = "0.4.2"
    gem.summary = %Q{Ruby API to geographic operations}
    gem.description = %Q{Ruby API to geographic operations}
    gem.homepage = "http://github.com/gonow/go_maps"
    gem.authors = ["Gonow"]
    gem.add_development_dependency "rspec", ">= 1.2.9"
    gem.add_development_dependency "fakeweb", ">= 1.2.8"
    gem.add_dependency("crack", ">= 0.1.6")
    gem.add_dependency("nokogiri", ">= 1.4.1")
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "go_maps #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
