# HappyHour

This program was designed to find available Happy Hour specials near you! After inputting your zipcode, a list of 10 Happy Hour restaurants will be displayed. You can select each individual
restaurant to see the address, the number, the Happy Hour times, and the specials provided. There are other options such as 'list' which will show you the list of restaurants again, and
'zipcode', which will allow the user to input in a new zipcode, and will return a new list of Happy Hour locations which can be accessed for more information. This program scrapes the page 
happy-hour.com for results. 


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'happy_hour'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install happy_hour

## Usage

To run the program, open up terminal and make your way to the happy_hour folder. Then run ./bin/happy_hour to start program. 

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'glamorous-integer-8008'/happy_hour. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the HappyHour project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'glamorous-integer-8008'/happy_hour/blob/master/CODE_OF_CONDUCT.md).
