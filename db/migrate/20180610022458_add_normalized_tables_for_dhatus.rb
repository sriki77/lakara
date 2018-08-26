class AddNormalizedTablesForDhatus < ActiveRecord::Migration
  def change
    remove_column :dhatus, :padi
  end
end
