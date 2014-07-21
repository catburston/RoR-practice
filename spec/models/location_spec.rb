require 'rails_helper'

RSpec.describe Location, :type => :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  describe "testing iron_find method" do
    Location.create(name: 'SpecTest', city: 'Nowhere')
    it "iron_find functions as .find" do
      expect(Location.iron_find(1)).to eq(Location.find(1))
    end
  end

  describe "testing last_created method" do
    Location.create name: 'Dom', city: 'Koeln', country: 'Germany', zip_code: 50660, description: "Koeln Cathedral"
    Location.create name: 'Sants', city: 'Barcelona', country: 'Spain'
    Location.create name: 'Tramway Hotel', city: 'Melbourne', country: 'Australia', zip_code: 3070, description: "Best pub in Melbourne"
    Location.create name: 'Plow St', city: 'Melbourne', country: 'Australia', zip_code: 3071, description: "Thornbury House"
    Location.create name: 'Pioch', city: 'Montpellier', country: 'France', zip_code: 34090, description: "Our flat in Monty P"
    Location.create name: 'Hbf', description: "Main Station"
    it "last_created functions as .order(created_at: :desc).limit(3)" do
      expect(Location.last_created(3)).to eq(Location.order(created_at: :desc).limit(3))
    end
  end

  describe "testing in_spain? method" do
    Location.create name: 'MOB', city: 'Barcelona', country: 'Spain', description: "Barcelona Main Station"
    Location.create name: 'Sants', city: 'Barcelona', country: 'Spain'
    Location.create name: 'Tramway Hotel', city: 'Melbourne', country: 'Australia', zip_code: 3070, description: "Best pub in Melbourne"
    Location.create name: 'Plow St', city: 'Melbourne', country: 'Australia', zip_code: 3071, description: "Thornbury House"
    Location.create name: 'Pioch', city: 'Montpellier', country: 'France', zip_code: 34090, description: "Our flat in Monty P"
    Location.create name: 'Hbf', description: "Main Station"
    it "only shows locations with Country = Spain" do
      expect(Location.in_spain?).to eq(Location.where(country: 'Spain'))
    end
  end

end