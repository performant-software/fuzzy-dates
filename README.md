# FuzzyDates
Fuzzy Dates is designed to store date values within a specified amount of accuracy. Each date is stored as a range and a descriptor, so that programmatic operations can still be performed, while providing a user-friendly label.

## Installation
Add this line to your application's Gemfile:

```ruby
gem "fuzzy_dates"
```

And then execute:
```bash
$ bundle install
```

Or install it yourself as:
```bash
$ gem install fuzzy_dates
```

## Usage

```ruby
class MyModel < ApplicationRecord
  include FuzzyDates::FuzzyDateable
  
  has_fuzzy_dates :start_date, :end_date
end
```

```ruby
class MyModelsSerializer < BaseSerializer
  index_attributes :id, :name, start_date: FuzzyDates::FuzzyDateSerializer, end_date: FuzzyDates::FuzzyDateSerializer
  show_attributes :id, :name, start_date: FuzzyDates::FuzzyDateSerializer, end_date: FuzzyDates::FuzzyDateSerializer
end
```

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
