class CreateWatchHistories < ActiveRecord::Migration[7.2]
  def change
    create_table :watch_histories do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.datetime :watched_at

      t.timestamps
    end
  end
end
