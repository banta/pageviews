# Pageviews
Pageviews is a lightweight ruby gem for tracking page views for rails application.
What about bots? They are ignored.  1200 known bots have been added to the ignore list as of
February 1, 2011.  Impressionist uses this list: http://www.user-agents.org/allagents.xml

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pageviews'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install pageviews

Generate the impressions table migration

    rails g pageviews

Run the migration

    rake db:migrate

The following fields will be generated in the migration:

    t.string   "pageview_type"        # model type: Widget
    t.integer  "pageview_id"          # model instance ID: @blog_post.id
    t.integer  "user_id"              # automatically logs @current_user.id
    t.string   "controller_name"      # logs the controller name
    t.string   "action_name"          # logs the action_name
    t.string   "view_name"            # TODO: log individual views (as well as partials and nested partials)
    t.string   "request_hash"         # unique ID per request, in case you want to log multiple impressions and group them
    t.string   "session_hash"         # logs the rails session
    t.string   "ip_address"           # request.remote_ip
    t.text     "params"               # request.params, except action name, controller name and resource id
    t.string   "referrer"             # request.referer
    t.datetime "created_at"           # I am not sure what this is.... Any clue?
    t.datetime "updated_at"           # never seen this one before either....  Your guess is as good as mine?? ;-)

## Usage


1. Log all actions in a controller

        class BlogPostController < ApplicationController
          track_views
        end

2. Specify actions you want logged in a controller

        class BlogPostController < ApplicationController
          track_views actions: [:show,:index]
        end

3. Make use of the `:session_hash` to keep track of unique views only.

        class BlogPostController < ApplicationController
          track_views actions: [:show], unique: [:session_hash]
        end

4. Add `acts_as_pageviews` in your model.  This allows you to attach pageviews to
   an Active Record model instance.

        class BlogPost < ActiveRecord::Base
          acts_as_pageviews
        end

5. Get unique pageviews count from a model.

        @blog_post.views

6. You can also specify pageviews count for specific actions.

        @blog_post.views('show')

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Banta/pageviews. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

