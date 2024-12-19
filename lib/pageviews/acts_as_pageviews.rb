module Pageviews
  module ActiveRecord
    module InstanceMethods
      def views(action = nil)
        scope = pageviews
        scope = scope.where(action_name: action) if action.present?
        scope.count
      end
    end
  end
end

ActiveSupport.on_load(:active_record) do
  extend Pageviews::ActiveRecord::InstanceMethods

  def self.acts_as_pageviews
    has_many :pageviews, as: :pageview, dependent: :destroy
    include Pageviews::ActiveRecord::InstanceMethods
  end
end

