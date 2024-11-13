class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products, if_not_exists: true do |t|
      t.string :name
      t.integer :price
      t.binary :file
      t.timestamps
    end
  end
end
