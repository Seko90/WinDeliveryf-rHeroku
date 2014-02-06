class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :articlenumber

      t.timestamps
    end
  end
end
