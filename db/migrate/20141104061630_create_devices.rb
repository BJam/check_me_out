class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :name
      t.string :status
      t.references :user, index: true

      t.timestamps null: false
    end
    add_index :devices, [:user_id, :status]
  end
end
