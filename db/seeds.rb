# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


seeds_list = [
  {
    model: CrimeType,
    seeds: [
      { id: 1, name: 'Murder' },
      { id: 2, name: 'Homicide' },
      { id: 3, name: 'Physical Injury' },
      { id: 4, name: 'Rape' },
      { id: 5, name: 'Robbery' },
      { id: 6, name: 'Theft' },
      { id: 7, name: 'Carnapping' },
      { id: 8, name: 'Cattle Rustling' },
    ]
  },
  {
    model: MostWanted,
    seeds: [
      { name: 'Anastasia Ivanova', crime_type_id: 7, exact_crime: 'hijacked Jack Ma\'s Ferrari', reward: 69000000, additional_info: 'Armed and Dangerous' },
      { name: 'Dimitri Vasiliv', crime_type_id: 1, exact_crime: 'Killed Donald Trump', reward: 99999999, additional_info: 'Very Armed And Dangerous' },
      { name: 'Austin Callaway', crime_type_id: 4, exact_crime: 'Hacked Landbank', reward: 54697869, additional_info: 'Wanted DEAD or ALIVE' },
      { name: 'Lee Jong Ip', crime_type_id: 8, exact_crime: 'Stole Allan Carreon\'s cow', reward: 10000, additional_info: 'Unorthodoxed way of thinking' },
    ]
  }
]

seeds_list.each do |seed_obj|
  print "Adding seeds to ", seed_obj[:model].name, "..."
  seed_obj[:model].destroy_all()
  seed_obj[:model].create(seed_obj[:seeds])
  puts "Done."
end
puts "Finished adding seeds lmao"

