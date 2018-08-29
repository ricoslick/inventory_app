class AddCustomerToDevices < ActiveRecord::Migration[5.1]
  def change
    add_reference :devices, :customer, foreign_key: true
  end
end
