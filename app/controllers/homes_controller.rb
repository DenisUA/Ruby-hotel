require 'ApartmentsFilterForm.rb'
class HomesController < ApplicationController

  def index
    @apartments_filter = ApartmentsFilterForm.new if params[:apartments_filter_form].nil?
    @apartments_filter = ApartmentsFilterForm.new(filter_params) unless params[:apartments_filter_form].nil?
    @apartments = ApartmentsFilter.new(filter_params).filter
  end

  private

  def filter_params
    unless params[:apartments_filter_form].nil?
      return params.require(:apartments_filter_form).permit(:room_type, :start_from, :end_at, :price, :occupancy)
    end
    nil
  end
end
