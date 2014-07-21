class Location < ActiveRecord::Base
  # because we created the class Locations, this command is not necessary
  #set_table_name 'locations'
  def self.iron_find(i)
    Location.where(id:i).first
  end
end
