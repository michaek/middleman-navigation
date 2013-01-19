module Middleman
  module Navigation
    class Tree
      def self.build(sitemap)
        app = sitemap.app
        root_path = app.http_prefix + app.index_file
        root = sitemap.find_resource_by_destination_path root_path

        unless root.blank?
          SimpleNavigation::Configuration.run do |navigation|
            traverse(root, navigation)
          end
        end
      end

      def self.traverse(resource, navigation)
        children = visible_children(resource)

        unless children.blank?
          navigation.items do |level|
            children.each do |child|
              title = child.data.navigation[:title] || child.data.title
              url = child.data.navigation[:destination] || child.url

              level.item child.destination_path, title, url
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
    end
  end
end