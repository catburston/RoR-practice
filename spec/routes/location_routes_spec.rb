require 'rails_helper'

RSpec.describe "LocationsRouting", :type => :routing do
  describe "location testing" do
    it "routes to locations index" do
      expect(get: "/locations").to route_to("locations#index")
    end

    it "routes to location with id" do
      expect(get: "/locations/4").to route_to(controller: "locations", action: "show", id: "4")
    end
  end
end
