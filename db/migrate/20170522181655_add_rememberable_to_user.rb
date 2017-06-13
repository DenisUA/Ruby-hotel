class AddRememberableToUser < ActiveRecord::Migration[5.1]
  def self.up
    change_table :users do |t|
      ## Rememberable
      t.datetime :remember_created_at
    end
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
