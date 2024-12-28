$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
# spec/spec_helper.rb
require 'active_record'
require 'sqlite3'
require 'rspec'
require 'pageviews'  # Load your gem

# Connect to an in-memory SQLite database for tests
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: ':memory:'
)

# Define a simple schema for testing
ActiveRecord::Schema.define do
  create_table :test_models, force: true do |t|
    t.string :name
    t.integer :views_count, default: 0
  end
end

# Create a simple model for testing purposes
class TestModel < ActiveRecord::Base
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
end