class AddPriceAndTitleToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :price, :decimal
  	add_column :products, :title, :string
  end
end
