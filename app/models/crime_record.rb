class CrimeRecord < ApplicationRecord
  belongs_to :crime_type
  belongs_to :police_station
end
