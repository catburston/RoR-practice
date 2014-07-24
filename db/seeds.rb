# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

loc1 = Location.create name: 'Dom', city: 'Koeln', country: 'Germany', zip_code: 50660, description: "Koeln Cathedral"
loc2 = Location.create name: 'Sants', city: 'Barcelona', country: 'Spain', zip_code: 10000, description: "Main Station, Barcelona"
loc3 = Location.create name: "Tramway Hotel", city: 'Melbourne', country: 'Australia', zip_code: 03070, description: "Best pub in Melbourne"
loc4 = Location.create name: "Plow St", city: 'Melbourne', country: 'Australia', zip_code: 03071, description: "Thornbury House"
loc5 = Location.create name: 'Pioch', city: 'Montpellier', country: 'France', zip_code: 34090, description: "Our flat in Monty P"
loc6 = Location.create name: 'Hbf', city: 'Koeln', country: 'Germany', zip_code: 50660, description: "Main Station"

usr1 = User.create user_name: 'cat1788', user_firstname: 'Cat', user_lastname: 'Burston'
usr2 = User.create user_name: 'bza', user_firstname: 'Tom', user_lastname: 'Harrop'

Visit.create location_id: loc3.id, user_id: usr1.id, from_date: (DateTime.now + 3.hours), to_date: (DateTime.now + 4.hours)
Visit.create location_id: loc3.id, user_id: usr2.id, from_date: (DateTime.now + 3.hours), to_date: (DateTime.now + 4.hours)
Visit.create location_id: loc1.id, user_id: usr1.id, from_date: (DateTime.now + 2.days), to_date: (DateTime.now + 3.days)
Visit.create location_id: loc1.id, user_id: usr2.id, from_date: (DateTime.now + 2.days), to_date: (DateTime.now + 3.days)
Visit.create location_id: loc2.id, user_id: usr1.id, from_date: (DateTime.now + 6.days), to_date: (DateTime.now + 7.days)
Visit.create location_id: loc4.id, user_id: usr2.id, from_date: (DateTime.now + 7.days), to_date: (DateTime.now + 22.days)
Visit.create location_id: loc5.id, user_id: usr1.id, from_date: (DateTime.now + 3.days), to_date: (DateTime.now + 4.days)
Visit.create location_id: loc3.id, user_id: usr2.id, from_date: (DateTime.now + 8.hours), to_date: (DateTime.now + 10.hours)
Visit.create location_id: loc4.id, user_id: usr1.id, from_date: (DateTime.now + 6.days), to_date: (DateTime.now + 24.days)
Visit.create location_id: loc6.id, user_id: usr2.id, from_date: (DateTime.now + 7.days), to_date: (DateTime.now + 30.days)