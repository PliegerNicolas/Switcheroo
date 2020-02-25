class ChangingNatureOfEndDateInOrderModel < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :end_date, :string
  end
end
