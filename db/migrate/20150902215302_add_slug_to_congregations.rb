class AddSlugToCongregations < ActiveRecord::Migration
  def change
    add_column :congregations, :slug, :string
    add_index :congregations, :slug, unique: true
  end
end
