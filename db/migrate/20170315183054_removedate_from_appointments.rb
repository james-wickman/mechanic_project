class RemovedateFromAppointments < ActiveRecord::Migration[5.0]
  def change
  	remove_column :appointments, :date, :string
  end
end
