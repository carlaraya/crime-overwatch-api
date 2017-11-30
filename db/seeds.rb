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
      { id: 1, name: 'Anastasia Ivanova', crime_type_id: 7, exact_crime: 'hijacked Jack Ma\'s Ferrari', reward: 69000000, additional_info: 'Armed and Dangerous' },
      { id: 2, name: 'Dimitri Vasiliv', crime_type_id: 1, exact_crime: 'Killed Donald Trump', reward: 99999999, additional_info: 'Very Armed And Dangerous' },
      { id: 3, name: 'Austin Callaway', crime_type_id: 4, exact_crime: 'Hacked Landbank', reward: 54697869, additional_info: 'Wanted DEAD or ALIVE' },
      { id: 4, name: 'Lee Jong Ip', crime_type_id: 8, exact_crime: 'Stole Allan Carreon\'s cow', reward: 10000, additional_info: 'Unorthodoxed way of thinking' },
    ]
  },
  {
    model: PoliceStation,
    seeds: [
    ]
  {
    model: FeaturedCrime,
    seeds: [
      { id: 1, title: "Cyber Theft, Bank hacked", police_station_id: 10, crime_type_id: 6, content: "LandBank was hacked by a mysterious hacker named Austin Callaway. Last Valentines Day, many individuals failed to withdraw from their bank accounts due to the available funds of each person is 0.  The investigators concluded that Austin Callaway is a former employee of the banks IT division and reportedly was withholded his pay for 3 months.The conclusion of this event may be hinted as the possible cause for one of the biggest bank cybertheft in history.", created_at: '2017-2-14' },
      { id: 2, title: "Greatest Murder", police_station_id: 5, crime_type_id: 1, content: "On Christmas Day, Ronald Dump was killed. Investigators pinpointed that the perpetrator is no other than a member of the Secret Service during the regime of Abomo. The assailant is secretly a member of the Russian Federation by the name of Dimitri Vasiliv. He shot Ronald Dump in the precisely in the chest exactly on the area where the heart is  located. Dump was dead on arrival on the St.Dominic's Hospital.", created_at: '2015-12-25' },
      { id: 3, title: "Cow is Missing", police_station_id: 9, crime_type_id: 8, content: "Our very own intergalactic ambassador with his unique technologies that he supposedly offered to us 'humans', Allan Carreon, had his Interglactic cow stolen. On the Night of the First day of 2016, A man who claims to be the intergalactic emperor named Lee Jong Ip, who claims to possess an incredible ammount of interstellar weapons of mass destruction stole the 'intergalactic cow' and declared it as a sign of war. The man was caught alone eating in a FastFood Chicken Restaurant after the said incident wherein the employee reported that the man brought in a cow with him into the establishment. Allan Carreon was delighted with his reunion with his intergalactic cow and 'decreed' he will not follow the country's law and give Lee Jong Ip due process but 'will execute him by his military troops by Order 66 with jedis holding light sabers' . The Judiciary when asked about this resolution of Carreon left no comment. ", created_at: '2016-1-1' },
      { id: 4, title: "Ferrari Hijacked", police_station_id: 7, crime_type_id: 7, content: "Jack Ma's Ferrari has been hijacked by a masked man'. On the first day of November 2014,  Jack Ma's legendary golden diamond-coated ferrari was stolen by a masked rider. Employing a hijacking of such vehicle requires the skills in various disciplines in engineering. Upon the failure of the perpatrator to escape the highway due to overspeeding at 300 MPH, the police identified the 'masked individual' as the former famous celebrity pole dancer Anastasia Ivanova of Bulgaria. Ivanova, known for her stunts in pole dancing is surprisingly a multi-degreed multi-licensed engineer who started to hijack vehicles for a secret Mafia Organization of Wealthy Associates. The mafia remains to be unknown due to Ivanova's non-compliance to answer the questions regarding the group. The police task force and investigative division will attempt to pinpoint the identity of the group. ", created_at: '2014-11-1' },
    ]
  }
]

seeds_list.reverse.each do |seed_obj|
  seed_obj[:model].destroy_all
end
seeds_list.each do |seed_obj|
  print "Adding seeds to ", seed_obj[:model].name, "..."
  seed_obj[:model].destroy_all
  hmm = seed_obj[:model].create(seed_obj[:seeds])
  #puts hmm[0].errors.inspect
  puts "Done."
end
puts "Finished adding seeds lmao"

ActiveRecord::Base.connection.tables.each { |t| ActiveRecord::Base.connection.reset_pk_sequence!(t) }
