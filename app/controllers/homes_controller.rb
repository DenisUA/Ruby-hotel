class HomesController < ApplicationController
  def index
    sql_arr_of_params = ['price >= :price_from',
                         'price <= :price_to',
                         'room_type = :room_type',
                         'occupancy = :occupancy']
    query = 'status = 0 AND' + sql_arr_of_params.join(' AND ')
    @apartment_filter = Apartment
                            .select_all
                            .where(query,
                                   {price_from: params[:price_from],
                                    price_to: params[:price_to],
                                    room_type: params[:room_type],
                                    occupancy: params[:occupancy]})
                            .to_hash
  end

  private

  def apartment_params
    params.require(:apartment_filter).permit(:status, :price, :description, :room_type, :occupancy)
  end
end
