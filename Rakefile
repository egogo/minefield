require 'rake/testtask'
task :default => [:test]
task :test do
  Rake::TestTask.new do |t|
    t.libs << "test"
    t.libs << "lib"
    t.test_files = FileList['test/*_test.rb']
  end
end