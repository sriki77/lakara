class CreateLakaras < ActiveRecord::Migration
  def change
    create_table :lakaras do |t|
      t.string :name, :null => false

      t.timestamps
      t.index :name, :unique=>true
    end
  end
end
