class CreateBuys < ActiveRecord::Migration[7.2]
  def change
    create_table :buys do |t|
      t.references :product, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
