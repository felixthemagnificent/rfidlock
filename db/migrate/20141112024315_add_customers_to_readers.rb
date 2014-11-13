class AddCustomersToReaders < ActiveRecord::Migration
  def change
    add_column :readers, :customer, :integer
  end
end
