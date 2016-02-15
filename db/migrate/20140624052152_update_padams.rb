class UpdatePadams < ActiveRecord::Migration
  def change
  end
  execute("UPDATE padams SET name='परस्मैपदी' WHERE name='परस्मैपदम्';")
  execute("UPDATE padams SET name='आत्मनेपदी' WHERE name='आत्मनेपदम्';")
end
