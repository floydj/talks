class AddMyCongregationToCongregations < ActiveRecord::Migration
  def change
    add_column :congregations, :my_congregation, :boolean
  end
end
