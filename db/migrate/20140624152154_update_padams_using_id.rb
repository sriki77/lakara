class UpdatePadamsUsingId < ActiveRecord::Migration
  def change
  end
  execute("UPDATE padams SET name='परस्मैपदी' WHERE id=1;")
  execute("UPDATE padams SET name='आत्मनेपदी'  WHERE id=2;")
end
