# Dynacord

Dynacord is a Ruby gem, designed to give you an easy interface to updating an A record based on the public IP address from where it's used. It is designed in a way to work with multiple DNS providers, and to be easily expanded. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dynacord'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dynacord

## Usage

To get the current public IP address (from the host where the call is made):

```
require 'dynacord'
ipaddr = Dynacord::Address.get
```

This method also accepts a single parameter as the host to use for determining the IP address:

```
require 'dynacord'
ipaddr = Dynacord::Address.get('http://myiplookup.example.com')
```

The mechanism for updating an A record with this IP address varies, based on the provider that you're using for DNS.

## Providers

Providers are DNS providers, that Dynacord can use to update an A record. Each provider has different requirements, so see the class for the provider you're using to get more specific details.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sedunne/dynacord.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Todo

* Add more providers
* Add provider-independent interface for common values (domain, apikey, record, etc)
* Tests
* Refactor address.rb to use net/http
* ???
