class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :workers, :name, :username

  end
end
