module RlmLogistics
  module Helpers
    module AuthenticationHelper

      def authenticate(options = {})
        options = default_options.merge(options)
        self.attribute :authentication, Hash, options
      end

      private

      def authentication_hash
        # FIXME: needs to pull from client
        {
          username:  "XXUSER",
          key_value: "XXKEY"
        }
      end

      def default_options
        { default: authentication_hash }
      end

    end
  end
end
