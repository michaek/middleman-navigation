module Middleman
  module Navigation
    class Tree
      DEFAULTS = {
        hidden: false,
        title: nil,
        destination: nil,
        weight: 0,
      }

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
              options = child.metadata[:page]['navigation']
              title = options['title'] || child.data.title
              url = options['destination'] || child.url

              level.item child.destination_path, title, url

              traverse child, level
            end
          end
        end
      end

      def self.visible_children(resource)
        html = resource.children.select {|r| r.ext == '.html'}
        # Reverse merge default options for menu candidates.
        # TODO: This doesn't affect child.data, so we need to clear caching somehow.
        # TODO: string/symbol keys are not handled well.
        html.map do |child|
          options = child.metadata[:page]
          options['navigation'] ||= {}
          options['navigation'] = DEFAULTS.stringify_keys.merge(options['navigation'])
          child.add_metadata(page: options)
          child
        end
        html.select!{|child| !child.metadata[:page]['navigation']['hidden']}
        html.sort! {|a, b| a.metadata[:page]['navigation']['weight'] <=> b.metadata[:page]['navigation']['weight']}
      end
    end
  end
end