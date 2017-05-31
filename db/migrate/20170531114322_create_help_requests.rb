class CreateHelpRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :help_requests do |t|
      t.string :text
      t.integer :user_id, index: true
      t.timestamps
    end
  end
end
