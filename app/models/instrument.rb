class Instrument < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :address, presence: true, length: { minimum: 6 }
  validates price:, presence: true
end
