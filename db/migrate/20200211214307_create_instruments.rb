class CreateInstruments < ActiveRecord::Migration[5.2]
  def change
    create_table :instruments do |t|
      t.string :name
      t.integer :price
      t.text :description
      t.string :latitude
      t.string :longitude
      t.string :photos
      t.string :status
      t.integer :views
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
