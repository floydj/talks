class AddServantToBrothers < ActiveRecord::Migration
  def change
    add_column :brothers, :privilege, :string
  end
end
