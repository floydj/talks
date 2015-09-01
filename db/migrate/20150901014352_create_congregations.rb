class CreateCongregations < ActiveRecord::Migration
  def change
    create_table :congregations do |t|
      t.string :name
      t.string :number
      t.string :meeting_time
      t.string :meeting_day
      t.string :kh_address
      t.string :kh_phone

      t.timestamps null: false
    end
  end
end
