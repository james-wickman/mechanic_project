class AddMechanicIdToAppointments < ActiveRecord::Migration[5.0]
  def change
    add_reference :appointments, :mechanic, foreign_key: true
  end
end
