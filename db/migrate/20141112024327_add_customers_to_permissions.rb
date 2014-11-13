class AddCustomersToPermissions < ActiveRecord::Migration
  def change
    add_column :permissions, :customer, :integer
  end
end
