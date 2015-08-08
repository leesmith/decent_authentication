# Decent Authentication
[![Build Status](https://travis-ci.org/leesmith/decent_authentication.svg?branch=master)](https://travis-ci.org/leesmith/decent_authentication) [![Code Climate](https://codeclimate.com/github/leesmith/decent_authentication/badges/gpa.svg)](https://codeclimate.com/github/leesmith/decent_authentication) [![Test Coverage](https://codeclimate.com/github/leesmith/decent_authentication/badges/coverage.svg)](https://codeclimate.com/github/leesmith/decent_authentication/coverage)

Decent Authentication is a sample application that implements authentication in Rails 4 without the use of a third-party generator or engine.  This is essentially a complete reproduction of [Ryan Bates' Authentication from Scratch railscast](http://railscasts.com/episodes/250-authentication-from-scratch-revised) with the addition of my RSpec test suite. In addition to authentication, features include rememberable cookie, password reset, and forwarding to protected routes.

Implementations in older versions of Rails are noted in their respective git tags.

## Dependencies

* Ruby 2.2
* PostgreSQL

## Getting Started

```
# install gems, create database.yml config, and setup the database
./bin/setup

# run the test suite
./bin/rake
```
