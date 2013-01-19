require 'middleman-navigation/tree'
require 'middleman-navigation/resource_list_manipulator'
require 'simple-navigation'
require 'simple-navigation/adapters/sinatra-middleman'
require 'simple-navigation/core/item'
SimpleNavigation::config_file_paths << File.expand_path("../simple-navigation", __FILE__)

module Middleman
  module Navigation
    class << self
      def registered(app)
        # Make a reference to the app on our patched simple-navigation Sinatra 
        # adapter so we can use the app's settings for proper URLs.
        SimpleNavigation::Adapters::Sinatra.middleman_app = app

        app.helpers SimpleNavigation::Helpers
        app.ready do
          sitemap.register_resource_list_manipulator :navigation, ResourceListManipulator.new(sitemap)
        end
      end
      alias :included :registered
    end
  end
end

::Middleman::Extensions.register(:navigation, Middleman::Navigation) 