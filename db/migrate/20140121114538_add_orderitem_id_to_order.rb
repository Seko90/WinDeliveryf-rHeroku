class AddOrderitemIdToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :orderitem_id, :integer
    add_index :orders, :orderitem_id
  end
end
