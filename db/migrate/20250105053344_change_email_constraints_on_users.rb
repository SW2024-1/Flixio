class ChangeEmailConstraintsOnUsers < ActiveRecord::Migration[7.2]
  def change
    change_column_null :users, :email, true  # nullを許可
    remove_index :users, :email  # emailのユニークインデックスを削除
  end
end
