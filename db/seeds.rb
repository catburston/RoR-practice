# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

loc1 = Location.create name: 'Dom', city: 'Koeln', country: 'Germany', zip_code: 50660, description: "Koeln Cathedral"
loc2 = Location.create name: 'Sants', city: 'Barcelona', country: 'Spain'
loc3 = Location.create name: 'Tramway Hotel', city: 'Melbourne', country: 'Australia', zip_code: 3070, description: "Best pub in Melbourne"
loc4 = Location.create name: 'Plow St', city: 'Melbourne', country: 'Australia', zip_code: 3071, description: "Thornbury House"
loc5 = Location.create name: 'Pioch', city: 'Montpellier', country: 'France', zip_code: 34090, description: "Our flat in Monty P"
loc6 = Location.create name: 'Hbf', description: "Main Station"

Visit.create location_id: loc3.id, user_name: 'Cat', from_date: (DateTime.now - 3.hours), to_date: (DateTime.now)
Visit.create location_id: loc3.id, user_name: 'Tom', from_date: (DateTime.now - 3.hours), to_date: (DateTime.now)
Visit.create location_id: loc1.id, user_name: 'Cat', from_date: (DateTime.now - 2.days), to_date: (DateTime.now - 1.days)
Visit.create location_id: loc1.id, user_name: 'Tom', from_date: (DateTime.now - 2.days), to_date: (DateTime.now - 1.days)
Visit.create location_id: loc2.id, user_name: 'Cat', from_date: (DateTime.now - 6.days), to_date: (DateTime.now - 5.days)
Visit.create location_id: loc4.id, user_name: 'Tom', from_date: (DateTime.now - 20.days), to_date: (DateTime.now - 18.days)
Visit.create location_id: loc5.id, user_name: 'Cat', from_date: (DateTime.now - 3.days), to_date: (DateTime.now - 2.days)
Visit.create location_id: loc3.id, user_name: 'Dario', from_date: (DateTime.now - 8.hours), to_date: (DateTime.now - 7.hours)
Visit.create location_id: loc4.id, user_name: 'Cat', from_date: (DateTime.now - 20.days), to_date: (DateTime.now - 18.days)
Visit.create location_id: loc6.id, user_name: 'Tom', from_date: (DateTime.now - 24.days), to_date: (DateTime.now - 23.days)
