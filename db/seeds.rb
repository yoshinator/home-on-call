# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(fname: "rafael", lname: "Calle", email: "pito@gmail.com", client_access: true, password:"123123123")


m0 = Market.create(name: "Master", state: "NJ")
m1 = Market.create(name: "North East Jersey", state: "NJ")
m2 = Market.create(name: "Pinellas Tampa Florida", state: "FL")
m3 = Market.create(name: "South East Florida", state: "FL")

HUDSONCOUNTY = %w(Bayonne Harrison Hoboken East\ Newark Guttenberg Jersey\ City Kearny North\ Bergen Secaucus Union\ City Weehawken West\ New\ York Hudson\ County)

BERGENCOUNTY = %w(Allendale Alpine Bergenfield Bogota Carlstadt Cliffside\ Park Closter Cresskill Demarest Dumont East\ Rutherford Edgewater Elmwood\ Park Emerson Englewood Englewood\ Cliffs Fair\ Lawn Fairview Fort\ Lee Franklin\ Lakes Garfield Glen\ Rock Hackensack Harrington\ Park Hasbrouck\ Heights Haworth Hillsdale Ho-Ho-Kus Leonia Little\ Ferry Lodi Lyndhurst Kingsland Mahwah Cragmere\ Park Darlington Fardale Masonicus Pulis\ Mills Maywood Midland\ Park Montvale Moonachie New\ Milford North\ Arlington Northvale Norwood Oakland Old\ Tappan Oradell Palisades\ Park Paramus Park\ Ridge Ramsey Ridgefield Ridgefield\ Park Ridgewood River\ Edge River\ Vale Rochelle\ Park Rockleigh Rutherford Saddle\ Brook Saddle\ River South\ Hackensack Teaneck Tenafly Teterboro Upper\ Saddle\ River Waldwick Wallington Washington\ Township Westwood Woodcliff\ Lake Wood-Ridge Wyckoff Bergen\ County")

# West Milford and Ringwood should go into Sussex County to break it up a little better
PASSAICCOUNTY = %w(Paterson Little\ Falls Pompton\ Lakes Hawthorne Clifton Totowa Haledon Bloomingdale Passaic North\ Haledon Wayne Woodland\ Park Wanaque Prospect\ Park)

ESSEXCOUNTY = %w(Newark East\ Orange Belleville South\ Orange Fairfield North\ Caldwell Montclair Livingston Maplewood Millburn West\ Caldwell Roseland West\ Orange Caldwell Irvington Cedar\ Grove Essex\ Fells Bloomfield Nutley Verona City\ of\ Orange Glen\ Ridge)

def seedMarket(towns, county, state, market)
  towns.each do |town|
   t = Town.new(name: town, county: county, state: state)
   t.market = market
   t.save
  end
end 

seedMarket(HUDSONCOUNTY, "Hudson", "NJ", m1)
seedMarket(BERGENCOUNTY, "Bergen", "NJ", m1)
seedMarket(PASSAICCOUNTY, "Passaic", "NJ", m1)
seedMarket(ESSEXCOUNTY, "Essex", "NJ", m1)

BusinessType.create(name: "Master")
BusinessType.create(name: "HVAC")
BusinessType.create(name: "Painting")
BusinessType.create(name: "Junk Removal")

master_client = Client.new(fname: "yoan", lname: "ante", email: "yoanante@gmail.com", phone: "2016756069", company_name: "Ante Consulting", business_type_id: "1", active: true)
master_client.market=m0
master_client.save