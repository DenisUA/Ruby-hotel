class Apartment < ApplicationRecord
  has_and_belongs_to_many :users
  # Types of apartments
  SHARED = 0
  ECONOM = 1
  STANDART = 2
  TWIN = 3
  LUX = 4

  # Statuses of apartments
  AVAILABLE = 0
  BOOKED = 1
  CLEANING = 2

  # validations

  validates :room_number, :status, :price, :room_type, :occupancy, presence: true
  validates :room_number, uniqueness: true, numericality: { greater_than: 0 }
  validates :status, inclusion: { in: 0..2 }
  validates :room_type, inclusion: { in: 0..4 }
  validates :price, numericality: { greater_than: 0 }
  validates :occupancy, numericality: { greater_than: 0, less_than: 11 }
  validates :description, length: { maximum: 10 }
end
