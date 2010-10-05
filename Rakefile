require 'rubygems'
require 'rake/gempackagetask'
require 'rake/rdoctask'
require 'spec/rake/spectask'

load 'vertica.gemspec'
 
Rake::GemPackageTask.new(VERTICA_SPEC) do |pkg|
  pkg.need_tar = true
end
 
task :default => "test"

desc "Clean"
task :clean do
  include FileUtils
  rm_rf 'pkg'
end

Spec::Rake::SpecTask.new do |t|
  t.warning = true
  t.rcov = false
end

task :doc => [:rdoc]
namespace :doc do
  Rake::RDocTask.new do |rdoc|
    files = ["README", "lib/**/*.rb"]
    rdoc.rdoc_files.add(files)
    rdoc.main = "README.textile"
    rdoc.title = "Vertica Docs"
    rdoc.rdoc_dir = "doc"
    rdoc.options << "--line-numbers" << "--inline-source"
  end
end

desc "Run rcov on current app"
task :rcov do
  system "rm -rf coverage && rcov -o coverage -x rcov.rb test/*_test.rb"
  system("open coverage/index.html") if PLATFORM['darwin']
end
