require File.expand_path('../lib/fillform', __FILE__)

require 'rake/gempackagetask' 
spec = Gem::Specification.new do |s|
  s.name	= "fillform" 
  s.summary	= "Automatically completes forms" 
  s.description= File.read(File.join(File.dirname(__FILE__), 'README')) 
  s.requirements = [ 'An installed dictionary (most Unix systems have one)' ]
  s.version = TestLeadForm::Fillform::VERSION.dup
  s.author = "Dave Knapik"
  s.email = "dave@daveknapik.com"
  s.homepage = "http://www.daveknapik.com"
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>=1.9' 
  s.files	= Dir['**/**'] 
  s.executables = [ 'fillform' ] 
  s.has_rdoc	= false  
end 
Rake::GemPackageTask.new(spec).define