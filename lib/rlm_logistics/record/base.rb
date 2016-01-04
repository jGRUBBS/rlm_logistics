module RlmLogistics
  module Record
    class Base < ActiveRecord::Remote::Base

      def as_xml
        serializable_hash.to_xml(
          root:       "ITEM_FILTER",
          dasherize:  false,
          skip_types: true,
          upcase:     true,
          omit_nils:  true
        )
      end

    end
  end
end
