class Instrument < ApplicationRecord
  belongs_to :user
  has_many :rentals, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true, length: { minimum: 6 }
  validates :price, presence: true
end
