class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.time     :time
      t.text     :tweet
      t.integer  :stamp_type, default: 0
      t.text     :challenge
      t.timestamps
    end
  end
end
