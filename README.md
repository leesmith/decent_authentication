# Decent Authentication
[![Build Status](https://travis-ci.org/leesmith/decent_authentication.svg?branch=master)](https://travis-ci.org/leesmith/decent_authentication) [![Code Climate](https://codeclimate.com/github/leesmith/decent_authentication/badges/gpa.svg)](https://codeclimate.com/github/leesmith/decent_authentication) [![Test Coverage](https://codeclimate.com/github/leesmith/decent_authentication/badges/coverage.svg)](https://codeclimate.com/github/leesmith/decent_authentication/coverage)

Decent Authentication is a sample application that implements authentication in Rails without the
use of a third-party generator or engine. You might often hear the advice that you should not "Roll
your own authentication" but that doesn't mean you **have** to use a gem.

In addition to authentication using Rails' built-in `has_secure_password` and `has_secure_token`,
features include enabled/disabled user, password reset, and forwarding to protected routes.

## Dependencies

* Ruby 2.3
* PostgreSQL

## Getting Started

Run the setup script, start the server, then click 'Create Account' from the sign in screen.

```
# install gems, create database.yml config, and setup the database
./bin/setup
```

## Testing

```
# run the test suite
./bin/rake
```

```
# run the test suite as well as brakeman, simplecov, and rails_best_practices
./bin/rake analyze
```
