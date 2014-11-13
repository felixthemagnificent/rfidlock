class CreateCheckIns < ActiveRecord::Migration
  def change
    create_table :check_ins do |t|
      t.string :card_user
      t.string :readerSerial
      t.timestamps
    end
  end
end
