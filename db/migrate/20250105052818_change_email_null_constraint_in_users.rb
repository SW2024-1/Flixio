class ChangeEmailNullConstraintInUsers < ActiveRecord::Migration[7.2]
  def change
    change_column :users, :string, null: true
  end
end
