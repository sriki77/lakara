class AddSeparateMeaningColumn < ActiveRecord::Migration
  def change
    add_column :dhatus, :meaning, :string, :default => ""
  end
end
