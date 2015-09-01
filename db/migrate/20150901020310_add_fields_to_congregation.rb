class AddFieldsToCongregation < ActiveRecord::Migration
  def change
    add_column :congregations, :city, :string
    add_column :congregations, :state, :string
    add_column :congregations, :zip, :string
    add_column :congregations, :talk_coordinator, :string
    add_column :congregations, :talk_coordinator_phone, :string
    rename_column :congregations, :kh_address, :address
  end
end
