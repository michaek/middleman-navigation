module Middleman
  module Navigation
    class Tree
      def self.build(sitemap)
        @app = sitemap.app
        @root = sitemap.find_resource_by_destination_path @app.http_prefix+@app.index_file

        unless @root.blank?
          SimpleNavigation::Configuration.run do |navigation|
            traverse(@root, navigation)
          end
        end
      end

      def self.with_defaults(navigation)
        navigation = {} if navigation.blank?
        Middleman::Navigation::FRONTMATTER_DEFAULTS.merge navigation
      end

      def self.traverse(resource, navigation)
        children = visible_children(resource)

        navigation.items do |level|
          if resource == @root
            options = with_defaults @root.data.navigation
            add_navigation_node @root, level unless options[:hidden]
          end

          unless children.blank?
            children.each do |child|
              add_navigation_node child, level
              traverse child, level
            end
          end
        end
      end

      def self.visible_children(resource)
        visible = resource.children
        visible.select!{|child| !with_defaults(child.data.navigation)[:hidden]}
        visible.sort! {|a, b| with_defaults(a.data.navigation)[:weight] <=> with_defaults(b.data.navigation)[:weight]}
        visible
      end

      def self.add_navigation_node(node, level)
        options = with_defaults(node.data.navigation)
        title = options[:title] || node.data.title
        url = options[:destination] || node.url

        level.item node.destination_path, title, url, :highlights_on => %r(^#{url}(#{@app.index_file})?$)
      end
    end
  end
end
