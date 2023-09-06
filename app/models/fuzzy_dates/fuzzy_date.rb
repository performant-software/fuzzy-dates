module FuzzyDates
  class FuzzyDate < ApplicationRecord
    # Relationships
    belongs_to :dateable, polymorphic: true

    # Enumerated fields
    enum accurary: [:year, :month, :date]

    def present?
      self.start_date.present? || (self.description.present? && !self.description.empty?)
    end
  end
end
