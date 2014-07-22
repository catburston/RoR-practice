require 'rails_helper'

RSpec.describe LocationsController, :type => :controller do
  describe "finding index and show" do
    it "renders index" do
      get :index
      expect(response).to render_template('index')
    end

    it "renders show" do
      loc = Location.create
      get :show, id:loc.id
      expect(response).to render_template('show')
    end

    it "gets #show" do
      loc = Location.create
      get :show, id:loc.id
      expect(assigns(:location)).to eq(loc)
    end

    it "returns ok if location with that id exists" do
      loc = Location.create
      get :show, id:loc.id
      expect(response).to have_http_status(:ok)
    end

    # it "returns 404 if location with that id does not exist" do
    #   loc = Location.create
    #   get :show, id:loc.id
    #   expect(response).to have_http_status(404)
    # end
  end
end
