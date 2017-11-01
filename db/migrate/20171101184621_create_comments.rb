class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :remark
      t.references :guitar, foreign_key: true

      t.timestamps
    end
  end
end
