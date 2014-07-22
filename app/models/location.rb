class Location < ActiveRecord::Base
  #set up relationship between visits and locations
  has_many :visits
  # because we created the class Locations, this command is not necessary
  #set_table_name 'locations'
  def self.iron_find(i)
    Location.where(id:i).first
  end

  # def self.last_created(x)
  #   Location.order(created_at: :desc).limit(x)
  # end
  scope :last_created, -> (x) { order(created_at: :desc).limit(x) }

  def self.in_spain?
    Location.where(country: 'Spain')
  end

  def monthly_visits(m,y)
    #better query because it's not running through all visits then querying on locations
    self.visits.where('extract(year from from_date) = ?', y).where('extract(month from from_date) = ?', m)
    # Visit.where('extract(year from from_date) = ?', y).where('extract(month from from_date) = ?', m).where(location_id:self.id).count
  end
end
