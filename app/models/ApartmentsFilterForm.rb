class ApartmentsFilterForm
  include ActiveModel::Model
  attr_accessor(
          :price,
          :room_type,
          :occupancy,
          :start_from,
          :end_at
  )
end