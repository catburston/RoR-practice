class Visit < ActiveRecord::Base
  #set up relationship between visits and locations
  belongs_to :location
end
