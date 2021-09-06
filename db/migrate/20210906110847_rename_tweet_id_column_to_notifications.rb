class RenameTweetIdColumnToNotifications < ActiveRecord::Migration[5.2]
  def change
    rename_column :notifications, :post_id, :tweet_id
  end
end
