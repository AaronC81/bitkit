# Bitkit

Bitkit is a gem which **makes IRB more useful as a programmer's calculator**. Currently, the main
feature is much greater control over Ruby's number formatting:

```ruby
require 'bitkit'
puts 12 + 4 # => 16

# Let's use hexadecimal instead!
hex!
puts 12 + 4 # => 0x10

# If you're working with memory addresses, padding could be useful
pad! 8
puts 12 + 4 # => 0x00000010

# Binary is supported too
bin!
puts 12 + 4 # => 0b00010000

# You can also strip away the prefix if you like
prefix! false
puts 12 + 4 # => 00010000
```

Bitkit works by replacing the `#to_s` and `#inspect` implementation of integers, so it should work
no matter how you're inspecting or logging numeric values.

As you can probably imagine, it can also cause problems for libraries which are relying on how
numbers are converting to strings! But for just using IRB as a slightly more advanced calculator,
like I often do while programming, you're unlikely to hit any major problems.

## Installation and Usage

Install the gem with:

```sh
gem install bitkit
```

Then, you can either import it into a Ruby script or IRB. If you are using IRB, **you will run into 
problems unless you pass `--nomultiline --nocolorize`!**

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/AaronC81/bitkit. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/AaronC81/bitkit/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Bitkit project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/AaronC81/bitkit/blob/main/CODE_OF_CONDUCT.md).
