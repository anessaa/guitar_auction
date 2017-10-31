class DropGuitars < ActiveRecord::Migration[5.1]
  def change
    drop_table :guitars
  end

end
