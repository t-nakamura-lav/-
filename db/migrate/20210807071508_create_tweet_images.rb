class CreateTweetImages < ActiveRecord::Migration[5.2]
  def change
    create_table :tweet_images do |t|
      t.string   :tweet_image_id
      t.timestamps
    end
  end
end
