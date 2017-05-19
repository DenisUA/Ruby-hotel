class AddApartmentPhotosToApartments < ActiveRecord::Migration[5.1]
  def change
    add_column :apartments, :apartment_photos, :string
  end
end
