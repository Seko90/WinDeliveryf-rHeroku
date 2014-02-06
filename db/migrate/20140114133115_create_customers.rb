class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :TNummer
      t.string :Vname
      t.string :Nname
      t.string :Straße
      t.string :HNummer
      t.string :plz
      t.date :erstellt

      t.timestamps
    end
  end
end
