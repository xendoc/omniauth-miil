# OmniAuth Miil

This is the OmniAuth strategy for authenticating to Miil.
However Miil does not provide Open API and OAuth Services :(

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-miil', github: 'https://github.com/xendoc/omniauth-miil'
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