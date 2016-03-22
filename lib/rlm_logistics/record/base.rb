require 'rlm_logistics/helpers/authentication_helper'

module RlmLogistics
  module Record
    class Base < ActiveRecord::Remote::Base

      extend RlmLogistics::Helpers::AuthenticationHelper

      api_type :soap

      base_element "filterXML"

      def custom_options
        { authentication: credentials, company_number: RlmLogistics.company }
      end

      def credentials
        {
          username:  RlmLogistics.username,
          key_value: RlmLogistics.password
        }
      end

      def soap_options
        super.merge(
          root:         "ITEM_FILTER",
          namespace:    "http://ws.rlm.com",
          operation:    self.class.operation_path,
          base_element: self.class.base_element_name
        )
      end

    end
  end
end
