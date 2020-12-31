class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.integer :user_id
      t.integer :menu_id
      t.integer :day_of_the_week
      t.integer :time_zone
    end
  end
end
