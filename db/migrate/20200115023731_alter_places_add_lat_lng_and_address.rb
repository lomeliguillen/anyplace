class AlterPlacesAddLatLngAndAddress < ActiveRecord::Migration[5.2]
  def change
    remove_column :places, :latitude, :string
    remove_column :places, :longitude, :string
    add_column :places, :latitude, :float
    add_column :places, :longitude, :float
    add_column :places, :address, :string
  end
end
