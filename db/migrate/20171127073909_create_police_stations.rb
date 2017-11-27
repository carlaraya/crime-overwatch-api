class CreatePoliceStations < ActiveRecord::Migration[5.1]
  def change
    create_table :police_stations do |t|
      t.string :username
      t.string :password_digest
      t.string :name
      t.string :address
      t.decimal :lat
      t.decimal :lng
      t.string :email
      t.string :contact_info

      t.timestamps
    end
  end
end
