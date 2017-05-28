class RemoveUserIdFromApartments < ActiveRecord::Migration[5.1]
  def change
    remove_column :apartments, :user_id
  end
end
