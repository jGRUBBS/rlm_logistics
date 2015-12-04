module RlmLogistics
  module Helpers
    module AssociationHelper

      def has_many(association, options = {})
        association_name = parse_association_name(association, options)
        self.attribute association, Array[association_klass(association_name)]
      end

      def parse_association_name(association, options = {})
        if options[:as].present?
          options[:as]
        else
          association
        end
      end

      def association_klass(name)
        singular = name.to_s.singularize
        RlmLogistics::Record.const_get(singular.classify)
      end

    end
  end
end
