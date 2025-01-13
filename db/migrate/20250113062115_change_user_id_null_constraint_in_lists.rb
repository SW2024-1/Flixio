class ChangeUserIdNullConstraintInLists < ActiveRecord::Migration[7.2]
  def change
    change_column_null :lists, :user_id, true  # user_idカラムにnullを許可
  end
end
