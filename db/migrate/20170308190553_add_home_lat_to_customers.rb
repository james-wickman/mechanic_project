class AddHomeLatToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :home_lat, :string
  end
end
