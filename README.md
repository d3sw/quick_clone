# QuickClone [![Build Status](https://travis-ci.org/d3sw/quick_clone.svg?branch=master)](https://travis-ci.org/d3sw/quick_clone) [![Coverage Status](https://coveralls.io/repos/github/d3sw/quick_clone/badge.svg?branch=master)](https://coveralls.io/github/d3sw/quick_clone?branch=master)
[![Code Climate](https://codeclimate.com/github/d3sw/quick_clone/badges/gpa.svg)](https://codeclimate.com/github/d3sw/quick_clone)

Quickly clone an ActiveRecord object by providing a filter of attributes names.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'quick_clone'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install quick_clone

## Usage

Provide a simple way of cloning ActiveRecord Records

It will return an in memory object, you will need to save
the record yourself.

You supply two things to `clone_from` method

`Clonable.clone_from(original_object, filter)`

The above is a convenience method for:

`Clonable.new(original_object, filter).clone`

* Original object is just the object where you will copy properties from

* Filter is an array of properties you want to copy from the original_object
you can list the properties as symbols or strings.

If one of the items on that list is a hash, the key has to be the name
of the association, the value has to be a list of values that will be
copied from all the items of the association.

It handles different association types, belongs_to, has_many, and has_one

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/d3dw/quick_clone.

