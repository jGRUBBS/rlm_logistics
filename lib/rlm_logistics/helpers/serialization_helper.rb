module RlmLogistics
  module Helpers
    module SerializationHelper

      def to_xml
        serializable_hash.to_xml(
          root: "ITEM_FILTER",
          dasherize: false,
          skip_types: true
        )
      end

      def serializable_hash
        attribute_hash = {}
        attribute_set.each do |attribute|
          serialize_attribute(attribute_hash, attribute)
        end
        attribute_hash
      end

      def serialize_attribute(attribute_hash, attribute)
        return if attributes[attribute.name].nil?
        attribute_hash[attribute.name.upcase] = _serialize(attributes[attribute.name])
      end

      def _serialize(serialized)
        if serialized.respond_to?(:serializable_hash)
          serialized.serializable_hash
        else
          case serialized
          when Array
            serialized.map { |attr| _serialize(attr) }
          when BigDecimal
            serialized.to_s("F")
          when Hash
            Hash[serialized.map{ |k, v| [k.upcase, v] }]
          else
            serialized
          end
        end
      end

    end
  end
end
