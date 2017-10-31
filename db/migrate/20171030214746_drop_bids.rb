class DropBids < ActiveRecord::Migration[5.1]
  def change
    drop_table :bids
  end
end
