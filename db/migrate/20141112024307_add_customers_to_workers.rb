class AddCustomersToWorkers < ActiveRecord::Migration
  def change
    add_column :workers, :customer, :integer
  end
end
