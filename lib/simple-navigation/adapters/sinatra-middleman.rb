module SimpleNavigation
  module Adapters
    class Sinatra < Base
      def current_page?(url)
        # FIXME: this is disabled temporarily because it blows everything up.
        false
      end
    end
  end
end
