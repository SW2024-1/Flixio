class RemoveEmailFromUsers < ActiveRecord::Migration[7.2]
  def change
    # emailカラムが存在する場合のみ削除
    #if column_exists?(:users, :email)
      #remove_column :users, :email, :string
    #end
  end
end
