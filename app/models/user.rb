class User < ActiveRecord::Base
  has_many :visits

  validates :user_name, presence: true, length: { maximum: 30 }
  validates :user_firstname, presence: true, length: { maximum: 30 }
  validates :user_lastname, presence: true, length: { maximum: 30 }

  scope :last_created, -> (x) { order(created_at: :desc).limit(x) }

end
