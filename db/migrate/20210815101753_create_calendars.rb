class CreateCalendars < ActiveRecord::Migration[5.2]
  def change
    create_table :calendars do |t|
      t.integer  :stamp_type, default: 0
      t.datetime :start_time

      t.timestamps
    end
  end
end
