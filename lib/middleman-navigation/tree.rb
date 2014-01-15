module Middleman
  module Navigation
    class Tree
      def self.build(sitemap)
        @app = sitemap.app
        @root = sitemap.find_resource_by_destination_path @app.http_prefix+@app.index_file

        unless @root.blank?
          SimpleNavigation::Configuration.run do |navigation|
            navigation.items do |level|
              traverse(@root, level)
            end
          end
        end
      end

      def self.with_defaults(navigation)
        navigation = {} if navigation.blank?
        Middleman::Navigation::FRONTMATTER_DEFAULTS.merge navigation
      end

      def self.traverse(resource, navigation)
        if resource == @root
          add_navigation_node resource, navigation
        end

        visible_children(resource).each do |child|
          add_navigation_node child, navigation do |subnav|
            traverse child, subnav
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
        unless options[:hidden]
          level.item node.destination_path, title, url, :highlights_on => %r(^#{url}(#{@app.index_file})?$) do |subnav|
            yield(subnav) if block_given?
          end
        end
      end
    end
  end
end
