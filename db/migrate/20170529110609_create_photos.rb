class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.references :apartment, foreign_key: true
      t.string :photo
    end
  end
end
