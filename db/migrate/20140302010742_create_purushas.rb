class CreatePurushas < ActiveRecord::Migration
  def change
    create_table :purushas do |t|
      t.string :name, :null => false

      t.timestamps
      t.index :name, :unique=>true
    end
  end
end
