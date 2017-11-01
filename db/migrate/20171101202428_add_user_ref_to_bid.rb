class AddUserRefToBid < ActiveRecord::Migration[5.1]
  def change
    add_reference :bids, :user, foreign_key: true
  end
end
