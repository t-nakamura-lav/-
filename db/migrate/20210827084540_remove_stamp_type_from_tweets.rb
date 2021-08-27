class RemoveStampTypeFromTweets < ActiveRecord::Migration[5.2]
  def change
    remove_column :tweets, :stamp_type, :integer
  end
end
