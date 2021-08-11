class AddHourAttributeToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :hour_attribute, :integer
    add_column :tweets, :minute_attribute, :integer
  end
end
