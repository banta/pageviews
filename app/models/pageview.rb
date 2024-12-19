class Pageview < ApplicationRecord
  belongs_to :pageview, polymorphic: true, optional: true
  belongs_to :user, optional: true

  validates :controller_name, :action_name, presence: true
end