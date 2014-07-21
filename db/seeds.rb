# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

Location.create name: 'Dom', city: 'Koeln', country: 'Germany', zip_code: 50660, description: "Koeln Cathedral"
Location.create name: 'Sants', city: 'Barcelona', country: 'Spain'
Location.create name: 'Tramway Hotel', city: 'Melbourne', country: 'Australia', zip_code: 3070, description: "Best pub in Melbourne"
Location.create name: 'Plow St', city: 'Melbourne', country: 'Australia', zip_code: 3071, description: "Thornbury House"
Location.create name: 'Pioch', city: 'Montpellier', country: 'France', zip_code: 34090, description: "Our flat in Monty P"
Location.create name: 'Hbf', description: "Main Station"