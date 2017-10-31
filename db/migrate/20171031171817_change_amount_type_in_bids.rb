class ChangeAmountTypeInBids < ActiveRecord::Migration[5.1]
  def change
    change_column :bids, :amount, :integer
  end
end
