class AddDesciptionColumnsForDhatus < ActiveRecord::Migration
  def change
    add_column :dhatus, :aadi, :string, :default => ""
    add_column :dhatus, :pratyaya, :string, :default => ""
    add_column :dhatus, :padi, :string, :default => ""
    add_column :dhatus, :karma, :string, :default => ""
    add_column :dhatus, :sait, :string, :default => ""
  end
end
