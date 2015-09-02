class RemoveBrotherIdFromOutlines < ActiveRecord::Migration
  def change
    remove_column :outlines, :brother_id
  end
end
