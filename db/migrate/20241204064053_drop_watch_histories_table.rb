class DropWatchHistoriesTable < ActiveRecord::Migration[7.2]
  def change
    drop_table :watch_histories
  end
end
