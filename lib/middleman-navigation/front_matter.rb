# This approach to defaults is gross, and it doesn't belong here!
# TODO: There should be a way in middleman for extensions to provide frontmatter defaults.
# TODO: Remove this when middleman supports that.
module Middleman::CoreExtensions
  module FrontMatter
    class FrontmatterManager
      def with_defaults(data)
        unless data.first.blank?
          data.first['navigation'] ||= {}
          data.first['navigation'].reverse_merge! Middleman::Navigation::FRONTMATTER_DEFAULTS
        end
        data
      end

      def parse_yaml_front_matter_with_defaults(content)
        with_defaults parse_yaml_front_matter_without_defaults(content)
      end

      def parse_json_front_matter_with_defaults(content)
        with_defaults parse_json_front_matter_without_defaults(content)
      end

      alias_method_chain :parse_yaml_front_matter, :defaults
      alias_method_chain :parse_json_front_matter, :defaults
    end
  end
end