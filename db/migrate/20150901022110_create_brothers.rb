class CreateBrothers < ActiveRecord::Migration
  def change
    create_table :brothers do |t|
      t.references :congregation, index: true, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email

      t.timestamps null: false
    end
  end
end
