class AddAddressColumnToInstruments < ActiveRecord::Migration[5.2]
  def change
    add_column :instruments, :address, :string
  end
end
