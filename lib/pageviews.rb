require "pageviews/version"
require 'pageviews/engine' if defined?(Rails)
require 'pageviews/acts_as_pageviews'

module Pageviews
  # Load configuration from initializer
  def self.setup
    yield self
  end
end
