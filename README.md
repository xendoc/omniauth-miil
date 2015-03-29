# OmniAuth Miil

This is the OmniAuth strategy for authenticating to Miil.
However Miil does not provide Open OAuth Service and API :(

It was created for internal service.

[![Circle CI](https://circleci.com/gh/xendoc/omniauth-miil.svg?style=svg)](https://circleci.com/gh/xendoc/omniauth-miil)
[![Code Climate](https://codeclimate.com/github/xendoc/omniauth-miil/badges/gpa.svg)](https://codeclimate.com/github/xendoc/omniauth-miil)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-miil', github: 'xendoc/omniauth-miil'
```

And then execute:

```sh
$ bundle install
```

## Usage

You can integrate the strategy into your middleware in a config.ru:

```ruby
use OmniAuth::Builder do
  provider :miil, ENV['MIIL_CLIENT_ID'], ENV['MIIL_CLIENT_SECRET']
end
```

In a devise config/initializers/devise.rb:

```ruby
config.omniauth :miil, ENV['MIIL_CLIENT_ID'], ENV['MIIL_CLIENT_SECRET']
```

### License

OmniAuth Miil is available under the MIT license.
