# SloppyTime

One of the sloppy mistake you could make when defining scopes in ActiveRecord models is that you pass dates and times to its arguments:

```ruby
class Post < ActiveRecord::Base
  scope :last_week, where('created_at < ?', Time.zone.now)
end
```

This is wrong because `Time.zone.now` is only evaluated once when `post.rb` is loaded. You have to use `lambda` instead:

```ruby
class Post < ActiveRecord::Base
  scope :last_week, lambda { where('created_at < ?', Time.zone.now) }
end
```

This gem tries to detect such mistakes by overriding `Time.now`, `Date.today` and `DateTime.now` and scanning the caller code if the line matches with `/(named_)?scope/`. (I know it's naive. Pull requests are welcome if you have an idea to make it more robust)

```
WARNING: Your model has a scope with Time evaluated immediately. You might have to use lambda instead.
/path/to/demo/app/models/post.rb:2:   scope :last_week, where('created_at < ?', Time.zone.now)
```

See [Working with times](http://guides.rubyonrails.org/active_record_querying.html#working-with-times) in the Rails guide for more details.

## Installation

Add this line to your application's Gemfile:

```ruby
group :test do
  gem 'sloppy_time'
end
```

And then execute:

```
$ bundle
```

## Usage

Add it to `Gemfile` and you're all set. Be sure to only activate it in `test` and/or `development` bundler groups, because it is silly to enable this gem on production.

## Author

Tatsuhiko Miyagawa
