require 'rlm_logistics/helpers/authentication_helper'

module RlmLogistics
  module Record
    class Base < ActiveRecord::Remote::Base

      extend RlmLogistics::Helpers::AuthenticationHelper

      def as_xml
        serializable_hash.to_xml(xml_options)
      end

      def xml_options
        {
          root:       "ITEM_FILTER",
          dasherize:  false,
          skip_types: true,
          upcase:     true,
          omit_nils:  true
        }
      end

    end
  end
end
