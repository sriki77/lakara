class CreatePadams < ActiveRecord::Migration
  def change
    create_table :padams do |t|
      t.string :name , :null => false

      t.timestamps
      t.index :name, :unique=>true
    end
  end
end
