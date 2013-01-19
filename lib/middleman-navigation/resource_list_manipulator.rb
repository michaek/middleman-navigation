module Middleman
  module Navigation
    class ResourceListManipulator
      def initialize(sitemap)
        @sitemap = sitemap
      end
      def manipulate_resource_list(resources)
        Tree.build @sitemap
        resources
      end      
    end
  end
end