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

  # describe "find visits for a location" do
  #   it "returns a count of all the visits for a location for a month" do
  #     loc10 = Location.create name: 'XYZ Hotel', city: 'Melbourne', country: 'Australia', zip_code: 3070, description: "Best pub in Melbourne"
  #     Visit.create location_id: loc10.id, user_name: 'Cat', from_date: (DateTime.now - 3.hours), to_date: (DateTime.now)
  #     Visit.create location_id: loc10.id, user_name: 'Tom', from_date: (DateTime.now - 3.hours), to_date: (DateTime.now)
  #     Visit.create location_id: loc10.id, user_name: 'Dario', from_date: (DateTime.now - 8.hours), to_date: (DateTime.now - 7.hours)
  #     expect(loc10.monthly_visits(7,2014).count).to eq(3)
  #   end
  # end

  describe "test validation of name" do
    it "must be present" do
      location = Location.new
      expect(location.valid?).to eq (false)
    end
    it "must be less than 30 characters" do
      location = Location.new name: 'wwwwwooooorrrrrrfffffnnnnnssssssllllll'
      expect(location.valid?).to eq (false)
    end
    it "must be only alphanumeric" do
      location = Location.new name: '123'
      expect(location.valid?).to eq (false)
    end
  end

  describe "test validation of city" do
    it "must be present" do
      location = Location.new
      expect(location.valid?).to eq (false)
    end
    it "must be less than 30 characters" do
      location = Location.new city: 'wwwwwooooorrrrrrfffffnnnnnssssssllllll'
      expect(location.valid?).to eq (false)
    end
    it "must be only alphanumeric" do
      location = Location.new city: '123'
      expect(location.valid?).to eq (false)
    end
  end

  describe "test validation of country" do
    it "must be present" do
      location = Location.new
      expect(location.valid?).to eq (false)
    end
    it "must be less than 30 characters" do
      location = Location.new country: 'wwwwwooooorrrrrrfffffnnnnnssssssllllll'
      expect(location.valid?).to eq (false)
    end
    it "must be only alphanumeric" do
      location = Location.new country: '123'
      expect(location.valid?).to eq (false)
    end
  end

  describe "test validation of zip_code" do
    it "must be present" do
      location = Location.new
      expect(location.valid?).to eq (false)
    end
    it "must be less than 6 characters" do
      location = Location.new zip_code: '1234567'
      expect(location.valid?).to eq (false)
    end
    it "must be only numeric" do
      location = Location.new zip_code: 'abc'
      expect(location.valid?).to eq (false)
    end
  end

  describe "test validation of description" do
    it "must be present" do
      location = Location.new
      expect(location.valid?).to eq (false)
    end
    it "must be less than 256 characters" do
      location = Location.new description: '123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890abcdefghijklmnop...................................................'
      expect(location.valid?).to eq (false)
    end
  end

end