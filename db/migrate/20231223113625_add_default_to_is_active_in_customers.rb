class AddDefaultToIsActiveInCustomers < ActiveRecord::Migration[6.1]
  def up
    change_column :customers, :is_active, :boolean, default: true
  end
  
  def down
    change_column :customers, :is_active, :boolean, default: nil
  end
end
