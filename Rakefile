require 'rubygems'
require 'bundler'

begin
  Bundler.setup(:development, :doc)
rescue Bundler::BundlerError => e
  STDERR.puts e.message
  STDERR.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'rake'
require 'jeweler'
require './lib/ronin/sql/version.rb'

Jeweler::Tasks.new do |gem|
  gem.name = 'ronin-sql'
  gem.version = Ronin::SQL::VERSION
  gem.licenses = ['GPL-2']
  gem.summary = %Q{A Ruby library for Ronin that provids support for SQL related security tasks.}
  gem.description = %Q{Ronin SQL is a Ruby library for Ronin that provids support for SQL related security tasks.}
  gem.email = 'ronin-ruby@googlegroups.com'
  gem.homepage = 'http://github.com/ronin-ruby/ronin-sql'
  gem.authors = ['Postmodern']
  gem.has_rdoc = 'yard'
end
Jeweler::GemcutterTasks.new

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new
task :default => :spec

require 'yard'
YARD::Rake::YardocTask.new
