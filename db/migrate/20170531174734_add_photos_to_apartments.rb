class AddPhotosToApartments < ActiveRecord::Migration[5.1]
  def change
    add_column :apartments, :photos, :json
  end
end
