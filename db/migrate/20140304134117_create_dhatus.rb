class CreateDhatus < ActiveRecord::Migration
  def change
    create_table :dhatus do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
