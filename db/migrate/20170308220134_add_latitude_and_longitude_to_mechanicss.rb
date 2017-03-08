class AddLatitudeAndLongitudeToMechanicss < ActiveRecord::Migration[5.0]
  def change
    add_column :mechanics, :latitude, :float
    add_column :mechanics, :longitude, :float
  end
end
