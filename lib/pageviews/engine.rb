require 'pageviews'
require 'rails'
require 'active_record'
# require 'active_support'

module Pageviews
  class Engine < ::Rails::Engine
    initializer 'pageviews.controller' do
      ActiveSupport.on_load(:action_controller) do
        include PageviewsController::InstanceMethods
        extend PageviewsController::ClassMethods
      end
    end
  end
end