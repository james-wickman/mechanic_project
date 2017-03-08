class AddHomeLongToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :home_long, :string
  end
end
