class Pageview < ActiveRecord::Base
  belongs_to :pageview, :polymorphic => true
end
