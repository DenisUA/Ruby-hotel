require 'ApartmentsFilterForm.rb'
class HomesController < ApplicationController
  def index
    @apartments_filter = ApartmentsFilterForm.new
    @apartments = Apartment.all
  end

end
