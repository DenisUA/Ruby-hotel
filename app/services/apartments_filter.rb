class ApartmentsFilter
  def initialize(params)
    @params = params
    @apartments = Apartment.all
  end

  def filter
    return @apartments if @params.nil?
    occupancy_filter unless @params['occupancy'] == ''
    price_filter unless @params['price'] == ''
    room_type_filter unless @params['room_type'] == ''
    date_filter unless @params['start_from'] == '' || @params['end_at'] == ''
    @apartments
  end

private

  def occupancy_filter
    @apartments = @apartments.where(occupancy: @params['occupancy'])
  end

  def price_filter
    @apartments = @apartments.where('price BETWEEN ? AND ?', @params['price'].split(',')[0],
      @params['price'].split(',')[1])
  end

  def room_type_filter
    @apartments = @apartments.where(room_type: @params['room_type'])
  end

  def date_filter
    arr_booked_rooms = booked_room
    arr_booked_rooms.each do |o|
      @apartments = @apartments.reject { |k, _v| k.id == o }
    end
  end

  def booked_room
    arr = []
    orders = Order.where('status <= 1')
    orders.each do |o|
      booked = orders.where("#{Date.parse(@params['start_from'])} >= #{o['start_from']} "\
          "AND #{Date.parse(@params['end_at'])} <= #{o['end_at']} ")
                     .exists?
      arr << o.apartment_id if booked
    end
    arr
  end
end
