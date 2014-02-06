class AddProductIdToOrderitem < ActiveRecord::Migration
  def change
    add_column :orderitems, :product_id, :integer
    add_index :orderitems, :product_id
  end
end
