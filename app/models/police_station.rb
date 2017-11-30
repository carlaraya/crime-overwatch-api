class PoliceStation < ApplicationRecord
  has_secure_password
  has_and_belongs_to_many :most_wanteds
  has_many :featured_crimes
end
