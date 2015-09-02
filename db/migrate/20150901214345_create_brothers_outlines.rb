class CreateBrothersOutlines < ActiveRecord::Migration
  def change
    create_table :brothers_outlines do |t|
      t.references :brother
      t.references :outline
    end
    add_index :brothers_outlines, :brother_id
    add_index :brothers_outlines, :outline_id
  end
end
