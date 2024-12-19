require 'rails/generators'
require 'rails/generators/migration'

class PageviewsGenerator < Rails::Generators::Base
  include Rails::Generators::Migration
  source_root File.join(File.dirname(__FILE__), 'templates')

  def next_migration_number
    Time.now.utc.strftime("%Y%m%d%H%M%S")
  end

  def create_migration_file
    migration_template 'create_pageviews_table.rb', 'db/migrate/create_pageviews_table.rb'
  end
end
# Compare this snippet from lib/pageviews/version.rb: