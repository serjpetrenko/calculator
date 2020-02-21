# Calculator

### Simple way to calculate your comission

Quick example
```ruby
Calculator::Comission.call(amount: 100, comission_percent: 20, comission_amount: 2.0)

# =======>
# [22.0, 78.0]
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'calculator'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install calculator

## Usage

### Options
You can init new calculator with next options:

```ruby
Calculator::Comission.call(
  amount: 100, # -> your value and it's required argument
  comission_amount: 100, # -> your value of comission and it's optional argument, by default it's equal to 1.0
  comission_percent: 20, # -> your value of percentage and it's optional argument, by default it's equal to 20
  comission_entity: Product # -> your entity and it's optional argument, by default it's equal to nil
)
```

The returned value will be array with two values for example: `[20.0, 30.0]`

How it works:

First returned value from the array is a netto_amount:

```ruby
amount - comission_total
```

Second value from the array is a comission_total

```ruby
amount * comission_percent + comission_amount
```

If you pass comission_entity to Calculator then your entity should have a field comission_amount.

```ruby
class Product
  def comission_amount
    2.0
  end
end
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/calculator.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
