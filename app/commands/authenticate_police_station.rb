class AuthenticatePoliceStation
  prepend SimpleCommand
  def initialize(username, password)
    @username = username
    @password = password
  end
  def call
    JsonWebToken.encode(police_station_id: police_station.id) if police_station
  end
  private
  attr_accessor :username, :password
  def police_station
    police_station = PoliceStation.find_by_username(username)
    return police_station if police_station && police_station.authenticate(password)
    errors.add :police_station_authentication, 'invalid credentials'
    nil
  end
end
