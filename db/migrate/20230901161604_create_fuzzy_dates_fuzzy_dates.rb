class CreateFuzzyDatesFuzzyDates < ActiveRecord::Migration[7.0]
  def change
    create_table :fuzzy_dates_fuzzy_dates do |t|
      t.references :dateable, polymorphic: true, null: false, index: true
      t.string :attribute
      t.integer :accuracy
      t.boolean :range
      t.date :start_date
      t.date :end_date
      t.text :description

      t.timestamps
    end

    add_index :fuzzy_dates_fuzzy_dates, [:dateable_id, :dateable_type, :attribute], name: 'index_fuzzy_dates_dateable_id_dateable_type_attribute'
  end
end
