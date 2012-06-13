# Decent Authentication
[![Build Status](https://secure.travis-ci.org/leesmith/decent_authentication.png?branch=master)](http://travis-ci.org/leesmith/decent_authentication)

Decent Authentication is a sample application that implements authentication in Rails 3.2 without the use of a third-party generator or engine.  This is essentially a complete reproduction of [Ryan Bates' Authentication from Scratch railscast](http://railscasts.com/episodes/250-authentication-from-scratch) with my addition of RSpec unit and integration tests. In addition to authentication, features include rememberable cookie and password reset.

See the 'rails-3.0' tag for a legacy Rails 3.0 implementation.

## Getting Started

    cp config/database.sqlite.yml config/database.yml
    gem install bundler && bundle
    rake db:setup
    rake
