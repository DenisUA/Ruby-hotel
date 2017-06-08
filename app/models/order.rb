class Order < ApplicationRecord
  belongs_to :user
  belongs_to :apartment

  enum status: { booked: 0, in_progress: 1, cancelled: 2, expired: 3 }

  validates :total, :start_from, :end_at, :user_id, :apartment_id, presence: true
  validates :total, numericality: { greater_than: 0 }
  validate :start_from_date_not_in_past, on: :create

  # scope :is_booked, ->(start_from, end_at){where('')}

  # def mark_booked_rooms(date)
  #   @rides.each do |r|
  #     r.booked = Request.where(
  #         "ride_id=#{r.id} AND ? BETWEEN CAST(start_date AS date) AND CAST(end_date AS date) AND status<4", date
  #     ).exists?
  #   end
  # end

private

  def start_from_date_not_in_past
    return unless start_from < Date.today
    errors.add :start_from, 'start date cannot be in past'
  end
end
