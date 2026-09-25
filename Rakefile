require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new


task :load_env do |t|
  ENV['RACK_ENV'] ||= 'test'
  file_exists = if File.respond_to?(:exists?)
    File.exists?("../.#{ENV["RACK_ENV"]}_env")
  else
    File.exist?("../.#{ENV["RACK_ENV"]}_env")
  end

  if file_exists
    File.read("../.#{ENV["RACK_ENV"]}_env").split("\n").each do |var|
      name, value = var.split "="
      ENV[name] = value if name and value
    end
  end
end

Rake::Task['spec'].enhance ['load_env']

task test: :spec
task default: :spec
