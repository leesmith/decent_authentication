# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

if Gem.loaded_specs.has_key?('rspec-rails')
  require_relative 'config/application'
  require 'rubocop/rake_task'

  Rails.application.load_tasks

  RuboCop::RakeTask.new do |task|
    task.requires << 'rubocop-performance'
    task.requires << 'rubocop-rails'
    task.requires << 'rubocop-rspec'
  end
end
