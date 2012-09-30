desc 'Setup db config, project gems and db setup'
task :setup do
  system 'cp config/database.sqlite.yml config/database.yml'
  system 'gem install bundler'
  system 'bundle'
  system 'bundle exec rake db:setup'
end
