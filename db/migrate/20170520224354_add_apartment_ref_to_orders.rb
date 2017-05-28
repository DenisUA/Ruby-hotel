class AddApartmentRefToOrders < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :apartment, foreign_key: true
  end
end
