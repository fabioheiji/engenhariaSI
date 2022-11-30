class AddGeolocationToMatches < ActiveRecord::Migration[7.0]
  def change
    add_column :matches, :latitude, :float
    add_column :matches, :longitude, :float
  end
end
