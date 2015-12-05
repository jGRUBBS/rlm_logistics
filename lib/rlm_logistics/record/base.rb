require 'rlm_logistics/helpers/association_helper'
require 'rlm_logistics/helpers/validation_helper'
require 'rlm_logistics/helpers/request_helper'
require 'rlm_logistics/helpers/authentication_helper'
require 'rlm_logistics/helpers/serialization_helper'

module RlmLogistics
  module Record
    class Base

      include Virtus.model
      extend  RlmLogistics::Helpers::AssociationHelper
      extend  RlmLogistics::Helpers::ValidationHelper
      extend  RlmLogistics::Helpers::RequestHelper
      extend  RlmLogistics::Helpers::AuthenticationHelper
      include RlmLogistics::Helpers::SerializationHelper

      def save
      end

    end
  end
end
