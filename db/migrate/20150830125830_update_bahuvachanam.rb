class UpdateBahuvachanam < ActiveRecord::Migration
  def change
  end
  execute("UPDATE vachanams SET name='बहुवचनम्' WHERE name='बहुवचनम';")
end
