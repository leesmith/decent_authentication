desc 'Run brakeman static analysis'
task :brakeman do
  sh "./bin/brakeman -o brakeman.html"
end
