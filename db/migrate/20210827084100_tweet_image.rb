class TweetImage < ActiveRecord::Migration[5.2]
  def change
    drop_table :tweet_images
  end
end
