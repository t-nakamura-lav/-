class CreateUserInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :user_infos do |t|
      t.string   :name
      t.string   :profile_image_id
      t.text     :introduction
      t.integer  :age_status, default: 0
      t.integer  :job_status, default: 0
      t.text     :challenge_contents
      t.timestamps
    end
  end
end
