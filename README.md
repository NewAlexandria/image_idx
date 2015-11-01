# ImageIdx

Find image files on-disk, by height/width ratio and size

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'image_idx'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install image_idx

## Usage

If you use `rubygems` to installt he gem at the comandline, you can then use it in your shell
```
cd ~/my/image/dir
image_idx wide
```

ImageIdx will recurse through all files in sub-dirs.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment. Run `bundle exec image_idx` to use the gem in this directory, ignoring other installed copies of this gem.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/image_idx. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

