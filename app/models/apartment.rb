class Apartment < ApplicationRecord
  has_many :orders
  mount_uploaders :photos, PhotoUploader
  serialize :photos, JSON

  enum room_type: { shared: 0, econom: 1, standart: 2, twin: 3, lux: 4 }
  enum status: { available: 0, booked: 1, cleaning: 2 }
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
  validates :price, numericality: { greater_than: 0 }
  validates :occupancy, numericality: { greater_than: 0, less_than: 11 }
  validates :description, length: { maximum: 200 }
end
