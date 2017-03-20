class AddDatetimeToAppointments < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :date, :datetime
  end
end
