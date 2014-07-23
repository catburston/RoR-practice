require 'rails_helper'

RSpec.describe Visit, :type => :model do
  describe "test validation of user_name" do
    it "must be present" do
      visit = Visit.new
      expect(visit.valid?).to eq (false)
    end
    it "must be less than 30 characters" do
      visit = Visit.new user_name: 'wwwwwooooorrrrrrfffffnnnnnssssssllllll'
      expect(visit.valid?).to eq (false)
    end
    it "must be only alphanumeric" do
      visit = Visit.new user_name: '123'
      expect(visit.valid?).to eq (false)
    end
  end

  describe "test validation of location_id" do
    it "must be present" do
      visit = Visit.new
      expect(visit.valid?).to eq (false)
    end
    it "must be only numeric" do
      visit = Visit.new location_id: 'abc'
      expect(visit.valid?).to eq (false)
    end
  end

  describe "test validation of from_date" do
    it "must be present" do
      visit = Visit.new
      expect(visit.valid?).to eq (false)
    end
    it "must be be in the future" do
      visit = Visit.new from_date: (Time.now - 1.day)
      expect(visit.valid?).to eq (false)
    end
    it "from_date must be earlier than to_date" do
      visit = Visit.new from_date: (Time.now + 1.day), to_date: Time.now
      expect(visit.valid?).to eq (false)
    end
  end

  describe "test validation of to_date" do
    it "must be present" do
      visit = Visit.create
      expect(visit.valid?).to eq (false)
    end
  end
end
