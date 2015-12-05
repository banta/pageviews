class CreatePageviewsTable < ActiveRecord::Migration
  def self.up
    create_table :pageviews, :force => true do |t|
      t.string :pageview_type
      t.integer :pageview_id
      t.integer :user_id
      t.string :controller_name
      t.string :action_name
      t.string :view_name
      t.string :request_hash
      t.string :ip_address
      t.string :session_hash
      t.text :referrer
      t.text :params
      t.timestamps
    end
    add_index :pageviews, [:pageview_type, :pageview_id, :request_hash], :name => "poly_request_index", :unique => false
    add_index :pageviews, [:pageview_type, :pageview_id, :ip_address], :name => "poly_ip_index", :unique => false
    add_index :pageviews, [:pageview_type, :pageview_id, :session_hash], :name => "poly_session_index", :unique => false
    add_index :pageviews, [:controller_name,:action_name,:request_hash], :name => "controlleraction_request_index", :unique => false
    add_index :pageviews, [:controller_name,:action_name,:ip_address], :name => "controlleraction_ip_index", :unique => false
    add_index :pageviews, [:controller_name,:action_name,:session_hash], :name => "controlleraction_session_index", :unique => false
    add_index :pageviews, [:pageview_type, :pageview_id, :params], :name => "poly_params_request_index", :unique => false
    add_index :pageviews, :user_id
  end

  def self.down
    drop_table :pageviews
  end
end
