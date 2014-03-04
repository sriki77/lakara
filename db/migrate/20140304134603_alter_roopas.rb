class AlterRoopas < ActiveRecord::Migration
  def change
    change_table :roopas do |t|
      t.belongs_to :dhatus
    end
  end

  execute('ALTER TABLE roopas ADD CONSTRAINT roopa_dhatu_fk FOREIGN KEY (dhatu_id) REFERENCES dhatus (id);')
end
