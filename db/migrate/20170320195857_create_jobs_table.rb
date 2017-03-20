class CreateJobsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.references :vehicle, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :mechanic_id
      t.string :cost
      t.datetime :start_time
      t.datetime :end_time
      t.text :customer_description
      t.boolean :available
      t.text :mechanic_notes
      t.integer :appointment_id
      t.text :type

      t.timestamps
    end
  end
end
