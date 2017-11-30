class MostWanted < ApplicationRecord
  belongs_to :crime_type
  has_and_belongs_to_many :police_stations
  validates :name, presence: true
end
