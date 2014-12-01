class Refactoring < ActiveRecord::Migration
  def change
    rename_column :readers, :customer, :user_id
    rename_column :workers, :customer, :user_id
    rename_column :permissions, :user_id, :worker_id
    rename_column :permissions, :customer, :user_id
    rename_column :check_ins, :customer, :user_id
  end
end
