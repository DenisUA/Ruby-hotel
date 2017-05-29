class HomesController < ApplicationController
  def index
    sql_arr_of_params = ['price >= :price_from',
                         'price <= :price_to',
                         'room_type = :room_type',
                         'occupancy = :occupancy']
    query = 'status = 0'
    query + ' AND ' + sql_arr_of_params[0] unless params[:price_from].nil?
    query + ' AND ' + sql_arr_of_params[1] unless params[:price_to].nil?
    query + ' AND ' + sql_arr_of_params[2] unless params[:room_type].nil?
    query + ' AND ' + sql_arr_of_params[3] unless params[:occupancy].nil?

    params_hash = {}
    params.each_key {|key| params_hash << key}
    @apartment_filter = Apartment
                            .select_all
                            .where(query,
                                   params_hash)
                            .to_hash
  end

  private

  def apartment_params
    params.require(:apartment_filter).permit(:status, :price, :description, :room_type, :occupancy)
  end
end
