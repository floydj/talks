class CreateOutlines < ActiveRecord::Migration
  def change
    create_table :outlines do |t|
      t.string :title
      t.integer :number

      t.timestamps null: false
    end
  end
end
