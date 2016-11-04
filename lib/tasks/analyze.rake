desc 'Run static analysis'
task :analyze do
  Rake::Task['spec'].invoke
  Rake::Task['brakeman'].invoke
  Rake::Task['rails_best_practices'].invoke
end
