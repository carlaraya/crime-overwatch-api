class CreateJoinTableIsLookingFor < ActiveRecord::Migration[5.1]
  def change
    create_join_table :most_wanteds, :police_stations do |t|
      # t.index [:most_wanted_id, :police_station_id]
      # t.index [:police_station_id, :most_wanted_id]
    end
  end
end
