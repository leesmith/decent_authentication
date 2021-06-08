# Decent Authentication
[![Build Status](https://github.com/leesmith/decent_authentication/workflows/Build/badge.svg)](https://github.com/leesmith/decent_authentication/actions) [![Code Climate](https://codeclimate.com/github/leesmith/decent_authentication/badges/gpa.svg)](https://codeclimate.com/github/leesmith/decent_authentication)

Decent Authentication is a sample application that implements authentication in Rails without the
use of a third-party generator or engine. You might often hear the advice that you should not "Roll
your own authentication" but that doesn't mean you **have** to use a gem.

Features:

- Only allow enabled users to sign in
- Request password reset via email
- Forward to protected routes upon successful sign in

Secure defaults:

- Passwords must be [8 alphanumeric characters](https://github.com/leesmith/decent_authentication/blob/master/app/models/user.rb)
- Password reset requests [expire after 2 hours](https://github.com/leesmith/decent_authentication/blob/master/app/services/recover_password.rb)
- Session cookies [expire after 30 minutes](https://github.com/leesmith/decent_authentication/blob/master/config/initializers/session_store.rb)

[Demo](https://decent-authentication.herokuapp.com/sign-in)

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
# run the test suite as well as brakeman, simplecov, rails_best_practices, and rubocop
./bin/rake analyze
```
