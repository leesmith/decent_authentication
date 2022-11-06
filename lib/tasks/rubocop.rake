if Gem.loaded_specs.has_key?("rubocop")
  require "rubocop/rake_task"

  RuboCop::RakeTask.new do |task|
    task.requires << "rubocop-performance"
    task.requires << "rubocop-rails"
    task.requires << "rubocop-rspec"
  end
end
