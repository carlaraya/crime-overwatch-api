class CreateMostWanteds < ActiveRecord::Migration[5.1]
  def change
    create_table :most_wanteds do |t|
      t.string :name
      t.references :crime_type, foreign_key: true
      t.string :exact_crime
      t.integer :reward
      t.text :additional_info

      t.timestamps
    end
  end
end
