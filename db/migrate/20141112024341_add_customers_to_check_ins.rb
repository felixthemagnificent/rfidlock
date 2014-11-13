class AddCustomersToCheckIns < ActiveRecord::Migration
  def change
    add_column :check_ins, :customer, :integer
  end
end
