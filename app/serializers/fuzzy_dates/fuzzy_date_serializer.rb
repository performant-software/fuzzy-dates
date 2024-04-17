module FuzzyDates
  class FuzzyDateSerializer < BaseSerializer
    index_attributes :id, :accuracy, :range, :start_date, :end_date, :description
    show_attributes :id, :accuracy, :range, :start_date, :end_date, :description
  end
end