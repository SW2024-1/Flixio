class CreateListitems < ActiveRecord::Migration[7.2]
  def change
    create_table :listitems do |t|
      t.references :list
      t.integer :product_id, null: false

      t.timestamps
    end
    add_foreign_key :listitems, :products, column: :product_id
  end
end
