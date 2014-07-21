class RemoveCityNameFromLocations < ActiveRecord::Migration
  def change
    remove_column :locations, :city_name, :string
  end
end
