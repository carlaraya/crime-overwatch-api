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
]

seeds_list.each do |seed_obj|
  print "Adding seeds to ", seed_obj[:model].name, "..."
  seed_obj[:model].destroy_all()
  seed_obj[:model].create(seed_obj[:seeds])
  puts "Done."
end
puts "Finished adding seeds lmao"

