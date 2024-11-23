class CreateBuyitems < ActiveRecord::Migration[7.2]
  def change
    create_table :buyitems do |t|
      t.references :product, null: false, foreign_key: true
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
