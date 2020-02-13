class AddDefaultValues < ActiveRecord::Migration[5.2]
  def change
    change_column_default :orders, :status, 'open'
    change_column_default :instruments, :views, 0
    change_column_default :instruments, :price, 0
    change_column_default :instruments, :status, 'available'
  end
end
