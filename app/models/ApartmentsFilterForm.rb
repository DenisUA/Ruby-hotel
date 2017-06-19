class ApartmentsFilterForm
  include ActiveModel::Model

  attr_accessor(
      :price,
      :room_type,
      :occupancy,
      :start_from,
      :end_at
  )

  validate :start_from_date_not_in_past
  validate :price_from
  validates :occupancy, numericality: { greater_than: 0, less_than: 11 }

  private

  def start_from_date_not_in_past
    return unless start_from < Date.today
    errors.add :start_from, 'start date cannot be in past'
  end

  def price_from
    price = :price
    return unless price.split(', ')[0] < 0
    errors.add :price, 'price cannot be less than 0'
  end

end
