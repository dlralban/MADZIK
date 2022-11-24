class Instrument < ApplicationRecord
  belongs_to :user
  has_many :rentals, dependent: :destroy
  has_one_attached :photo
  validates :name, presence: true
  validates :address, presence: true, length: { minimum: 6 }
  validates :price, presence: true

  include InstrumentConcern
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
