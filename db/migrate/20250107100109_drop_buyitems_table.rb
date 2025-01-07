class DropBuyitemsTable < ActiveRecord::Migration[7.2]
  def change
    drop_table :buyitems
  end
end
