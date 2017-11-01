class CreateBids < ActiveRecord::Migration[5.1]
  def change
    create_table :bids do |t|
      t.integer :amount
      t.references :guitar, foreign_key: true

      t.timestamps
    end
  end
end
