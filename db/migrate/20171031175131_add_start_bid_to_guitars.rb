class AddStartBidToGuitars < ActiveRecord::Migration[5.1]
  def change
    add_column :guitars, :start_bid, :integer
  end
end
