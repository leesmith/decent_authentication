desc 'Setup db config, project gems and db setup'
task :setup do
  system 'gem install bundler'
  system 'bundle'
  system 'bundle exec rake db:setup'
end
