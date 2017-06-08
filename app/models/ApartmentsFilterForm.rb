class ApartmentsFilterForm
  include ActiveModel::Model

  attr_accessor(
      :price,
      :room_type,
      :occupancy,
      :start_from,
      :end_at
  )

  # validate :start_from, date => Date.today
  #                                                message: "must be at least #{Date.today}" }, on: :index
  # validates :end_at, date: { after_or_equal_to: :start_from }
  # validates :price.to_s.split(', ')[0], numericality: { greater_than: 0 } unless :price.nil?
  # validates :price.to_s.split(', '), numericality: { greater_than: 0 } unless :price.nil?
  # validates :occupancy, numericality: { greater_than: 0, less_than: 11 }

end
