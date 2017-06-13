class DeleteTableApartmentsUsers < ActiveRecord::Migration[5.1]
  def change
    drop_table :apartments_users
  end
end
