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

      def self.traverse(resource, navigation)
        children = visible_children(resource)

        navigation.items do |level|
          if resource == @root
            add_navigation_node @root, level unless @root.data.navigation[:hidden]
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
        visible = resource.children.select {|child| child.data.navigation.present?}
        visible.select!{|child| !child.data.navigation[:hidden]}
        visible.sort! {|a, b| a.data.navigation[:weight] <=> b.data.navigation[:weight]}
        visible
      end

      def self.add_navigation_node(node, level)
        title = node.data.navigation[:title] || node.data.title
        url = node.data.navigation[:destination] || node.url

        level.item node.destination_path, title, url, :highlights_on => %r(^#{url}(#{@app.index_file})?$)
      end
    end
  end
end
