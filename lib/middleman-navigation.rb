require 'middleman-navigation/tree'
require 'simple-navigation'
require 'simple-navigation/adapters/sinatra-middleman'
SimpleNavigation::config_file_paths << File.expand_path("../simple-navigation", __FILE__)

module Middleman
  module Navigation
    class << self
      def registered(app)
        app.helpers SimpleNavigation::Helpers
        # This is run for every page to allow for changes in development.
        # TODO: Speed things up for deployment.
        app.before do
          Tree.build sitemap
        end
      end
      alias :included :registered
    end
  end
end

::Middleman::Extensions.register(:navigation, Middleman::Navigation) 