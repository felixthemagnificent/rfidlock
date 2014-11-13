class CreateReaders < ActiveRecord::Migration
  def change
    create_table :readers do |t|
      t.string :serial
      t.string :desc

      t.timestamps
    end
  end
end
