class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.integer :user_id
      t.integer :walker_id
      t.string :date
      t.timestamps
    end
  end
end
