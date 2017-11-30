class CreateCrimeRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :crime_records do |t|
      t.references :crime_type, foreign_key: true
      t.references :police_station, foreign_key: true
      t.integer :new
      t.integer :solved
      t.boolean :is_hidden

      t.timestamps
    end
  end
end
