desc 'Run rails_best_practices static analysis'
task :rails_best_practices do
  app_root = Rake.application.original_dir
  output_file = File.join(app_root, 'rails_best_practices.html')
  analyzer = RailsBestPractices::Analyzer.new(app_root, {'format' => 'html','output-file' => output_file})
  analyzer.analyze
  analyzer.output
end
