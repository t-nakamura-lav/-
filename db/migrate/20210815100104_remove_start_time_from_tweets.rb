class RemoveStartTimeFromTweets < ActiveRecord::Migration[5.2]
  def change
    remove_column :tweets, :start_time, :datetime
  end
end
