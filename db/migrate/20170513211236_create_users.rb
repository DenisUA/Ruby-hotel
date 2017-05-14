class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.boolean :admin, default: false
      t.boolean :gender
      t.date :date_of_birth
      t.timestamps null: false
    end
  end
end
