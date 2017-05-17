class CreateApartments < ActiveRecord::Migration[5.1]
  def change
    create_table :apartments do |t|
      t.string :room_number,    null: false
      t.string :status
      t.decimal :price,         precision: 8, scale: 2
      t.string :description
      t.string :type
      t.integer :occupancy
      t.timestamps
    end
  end
end
