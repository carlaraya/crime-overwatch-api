class CreateCrimeTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :crime_types do |t|
      t.string :name
    end
  end
end
