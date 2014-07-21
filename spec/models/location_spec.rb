require 'rails_helper'

RSpec.describe Location, :type => :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  describe "testing iron_find method" do
    Location.create(name: 'SpecTest', city: 'Nowhere')
    it "iron_find functions as .find" do
      expect(Location.iron_find(1)).to eq(Location.find(1))
    end
  end

end