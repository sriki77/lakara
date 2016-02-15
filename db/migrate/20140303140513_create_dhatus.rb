class CreateDhatus < ActiveRecord::Migration
  def change
    create_table :dhatus do |t|
      t.string :name
      t.string :description
      t.belongs_to (:padam)

      t.timestamps
    end
    execute('ALTER TABLE dhatus ADD CONSTRAINT dhatu_padam_fk FOREIGN KEY (padam_id) REFERENCES padams (id);')

  end
end
