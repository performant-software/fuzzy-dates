module FuzzyDates
  class FuzzyDateSerializer < BaseSerializer
    index_attributes :id, :range, :start_date, :end_date, :description, accuracy: -> (fd, *rest) { fd.accuracy_before_type_cast }
    show_attributes :id, :range, :start_date, :end_date, :description, accuracy: -> (fd, *rest) { fd.accuracy_before_type_cast }
  end
end