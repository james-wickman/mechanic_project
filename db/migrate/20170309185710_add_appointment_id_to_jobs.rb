class AddAppointmentIdToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :appointment_id, :integer
  end
end
