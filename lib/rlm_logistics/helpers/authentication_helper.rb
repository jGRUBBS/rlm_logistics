module RlmLogistics
  module Helpers
    module AuthenticationHelper

      def authenticate(options = {})
        options = default_options.merge(options)
        self.attribute :authentication, Hash, options
      end

      private

      def authentication_hash
        {
          username:  "",
          key_value: ""
        }
      end

      def default_options
        { default: authentication_hash }
      end

    end
  end
end
