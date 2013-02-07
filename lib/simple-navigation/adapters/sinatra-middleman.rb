module SimpleNavigation
  module Adapters
    class Sinatra < Base
      def self.middleman_app=(app)
        @@middleman_app = app
      end

      # Our request doesn't have a fullpath, so we must return path instead.
      def request_uri
        @prefix ||= @@middleman_app.nil? ? '/' : @@middleman_app.inst.http_prefix
        @prefix + request.path
      end
    end
  end
end
