class CreateFeaturedCrimes < ActiveRecord::Migration[5.1]
  def change
    create_table :featured_crimes do |t|
      t.string :title
      t.references :police_station, foreign_key: true
      t.references :crime_type, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
