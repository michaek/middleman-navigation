module SimpleNavigation
  module Adapters
    class Sinatra < Base
      # Our request doesn't have a fullpath, so we must return path instead.
      def request_uri
        # TODO: Respect app.http_prefix
        '/' + request.path
      end
    end
  end
end
