class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :instrument
  validates :start_date, presence: true
  validates :end_date, presence: true
end
