module Pageviews
  module ActiveRecord
    module InstanceMethods
      def views(action=nil)
        if action
          pageviews.where(action_name: action).count
        else
          pageviews.count
        end
      end
    end
  end
end

class ActiveRecord::Base
  def self.acts_as_pageviews
    include Pageviews::ActiveRecord::InstanceMethods
    has_many :pageviews, as: :pageview, dependent: :destroy
  end
end

