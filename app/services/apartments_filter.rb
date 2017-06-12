class ApartmentsFilter

  def initialize(params)
    @params = params
    @apartments = Apartment.all
  end

  def filter
    return @apartments if @params.nil?
    occupancy_filter unless @params['occupancy'] == ''
    price_filter unless @params['price']==''
    room_type_filter unless @params['room_type'] == ''
    @apartments
  end

  private

  def occupancy_filter
    @apartments = @apartments.where(occupancy: @params['occupancy'])
  end

  def price_filter
    @apartments = @apartments.where('price BETWEEN ? AND ?', @params['price'].split(',')[0],
                                    @params['price'].split(',')[1])
    puts "#{@apartments}"

  end

  def room_type_filter
    @apartments = @apartments.where(room_type: @params['room_type'])
    puts "#{@apartments}"

  end

end
