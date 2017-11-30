class FeaturedCrime < ApplicationRecord
  belongs_to :police_station
  belongs_to :crime_type
end
