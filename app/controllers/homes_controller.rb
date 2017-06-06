require 'ApartmentsFilterForm.rb'
class HomesController < ApplicationController
  def index
    @apartments_filter = ApartmentsFilterForm.new
    @apartments = Apartment.all
  end

  private

  def apartment_params
    params.require(:apartments_filter).permit(:room_type, :start_from, :end_at, :price, :occupancy)
  end
end
