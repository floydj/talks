class AddSlugToBrothers < ActiveRecord::Migration
  def change
    add_column :brothers, :slug, :string
    add_index :brothers, :slug, unique: true
  end
end
