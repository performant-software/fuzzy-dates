module FuzzyDates
  module FuzzyDateable
    extend ActiveSupport::Concern

    included do
      def self.has_fuzzy_dates(*attributes)
        attributes.each do |attribute|
          # Relationship
          has_one attribute, -> { where(attribute_name: attribute) }, as: :dateable, class_name: 'FuzzyDates::FuzzyDate', dependent: :destroy, required: false, inverse_of: :dateable

          # Nested attributes
          accepts_nested_attributes_for attribute, allow_destroy: true, reject_if: :is_empty?

          # Resourceable params
          allow_params "#{attribute}_attributes".to_sym => [:id, :accuracy, :range, :start_date, :end_date, :description, :_destroy]

          define_singleton_method("#{attribute}_join".to_sym) do
            table = self.arel_table
            date_table = FuzzyDate.arel_table.alias(attribute)

            table
              .join(date_table, Arel::Nodes::OuterJoin)
              .on(
                date_table[:dateable_id].eq(table[:id])
                  .and(date_table[:dateable_type].eq(self.to_s)
                  .and(date_table[:attribute_name].eq(attribute)))
              )
              .join_sources
          end
        end
      end

      private

      def is_empty?(attributes)
        !attributes['_destroy'].present? && !(attributes['start_date'].present? && attributes['end_date'].present?)
      end

    end

  end
end
