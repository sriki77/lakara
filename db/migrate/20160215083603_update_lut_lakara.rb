class UpdateLutLakara < ActiveRecord::Migration
  def change
  end
  execute("UPDATE lakaras SET name='लुट' WHERE name='लुट्';")
end
