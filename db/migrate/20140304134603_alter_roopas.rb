class AlterRoopas < ActiveRecord::Migration
   execute('ALTER TABLE roopas ADD CONSTRAINT roopa_dhatu_fk FOREIGN KEY (dhatu_id) REFERENCES dhatus (id);')
end
