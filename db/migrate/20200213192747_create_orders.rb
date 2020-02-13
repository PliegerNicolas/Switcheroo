class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.integer :renter_id
      t.references :instrument, foreign_key: true
      t.string :status
      t.date :due_date

      t.timestamps
    end
  end
end
