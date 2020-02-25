class AddingStartDateToOrdre < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :start_date, :string
    rename_column :orders, :due_date, :end_date
  end
end
