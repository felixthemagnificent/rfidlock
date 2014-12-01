class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :card
      t.references :reader, index: true

      t.timestamps
    end
  end
end
