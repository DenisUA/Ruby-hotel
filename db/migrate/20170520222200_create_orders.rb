class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :status, default: 0
      t.date :start_from
      t.date :end_at
      t.decimal :total, precision: 8, scale: 2

      t.timestamps
    end
  end
end
