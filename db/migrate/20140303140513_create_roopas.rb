class CreateRoopas < ActiveRecord::Migration
  def change
    create_table :roopas do |t|
      t.string :name, :null => false

      t.belongs_to (:dhatu)
      t.belongs_to (:purusha)
      t.belongs_to (:vachanam)
      t.belongs_to (:lakaras)
      t.belongs_to (:padam)
      t.timestamps
    end
    execute('ALTER TABLE roopas ADD CONSTRAINT roopa_padam_fk FOREIGN KEY (padam_id) REFERENCES padams (id);')
    execute('ALTER TABLE roopas ADD CONSTRAINT roopa_vachanam_fk FOREIGN KEY (vachanam_id) REFERENCES vachanams (id);')
    execute('ALTER TABLE roopas ADD CONSTRAINT roopa_lakara_fk FOREIGN KEY (lakaras_id) REFERENCES lakaras (id);')
    execute('ALTER TABLE roopas ADD CONSTRAINT roopa_purusha_fk FOREIGN KEY (purusha_id) REFERENCES purushas (id);')
  end
end
