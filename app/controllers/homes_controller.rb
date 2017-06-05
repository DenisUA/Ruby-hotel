class HomesController < ApplicationController
  def new
    @apartment_filter = ApartmentFilter.new
  end

  def create
    @apartment_filter = ApartmentFilter.new(apartment_params)
    @apartment_filter.request
  end

  private

  def apartment_params
    params.require(:apartment_filter).permit(:status,
                                             :price_from,
                                             :price_to,
                                             :description,
                                             :room_type,
                                             :occupancy)
  end
end
