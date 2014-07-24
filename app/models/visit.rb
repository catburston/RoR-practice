class Visit < ActiveRecord::Base
  #set up relationship between visits and locations
  belongs_to :location
  belongs_to :user
  #validation
  validates :from_date, presence: true
  validates :to_date, presence: true
  validates :user_id, presence: true
  validates :location_id, presence: true, numericality: { only_integer: true }
  validate :from_date_in_future
  validate :from_date_is_before_to_date

  def from_date_in_future
    if from_date < Time.now
      errors.add(:from_date, "cannot be in the past.")
    end
  end

  def from_date_is_before_to_date
    if from_date.to_i > to_date.to_i
      errors.add(:from_date, "cannot be after the 'to date'.")
    end
  end
end
