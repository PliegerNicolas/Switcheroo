class ChangeLatitudeLongitudeToFloatOnInstruments < ActiveRecord::Migration[5.2]
  def change
    change_column :instruments, :latitude, 'float USING CAST(latitude AS float)'
    change_column :instruments, :longitude, 'float USING CAST(longitude AS float)'
  end
end
