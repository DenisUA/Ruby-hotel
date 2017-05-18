class CreateApartmentsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :apartments_users, id: false do |t|
      t.belongs_to :apartment, index: true
      t.belongs_to :user, index: true
    end
  end
end
