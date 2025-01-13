class AddUserIdToLists < ActiveRecord::Migration[7.2]
  def change
    unless column_exists?(:lists, :user_id)
      add_column :lists, :user_id, :integer
    end
  end
end
