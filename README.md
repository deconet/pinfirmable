# Pinfirmable
A replacement for Devise `confirmable` to use a pin rather than an emailed link to confirm a users email. (Inspired by Slack)

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'pinfirmable'
```
And then execute:
```bash
$ bundle
```
Add the `pinfirmable` module to your devise model (e.g User)
```ruby
class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         ...
         :pinfirmable
```
```bash
rake db:migrate
# If your devise model isn't called user
rake db:migrate MODEL=admin
```
Add the javascript include to the asset pipeline.
```
//= require refile
```

## Todo
 - Encrypt the pin in the DB
 - Rate limit / n tries
 - Resend email

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
