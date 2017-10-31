class AddGuitarRefToBid < ActiveRecord::Migration[5.1]
  def change
    add_reference :bids, :guitar, foreign_key: true
  end
end
