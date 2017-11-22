class MostWanted < ApplicationRecord
  belongs_to :crime_type
  validates :name, presence: true
end
