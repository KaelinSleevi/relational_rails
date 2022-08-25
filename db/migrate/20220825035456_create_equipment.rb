class CreateEquipment < ActiveRecord::Migration[5.2]
  def change
    create_table :equipment do |t|
      t.string :brand
      t.float :price
      t.boolean :in_stock

      t.timestamps
    end
  end
end
