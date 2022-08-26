class AddEquipmentToShops < ActiveRecord::Migration[5.2]
  def change
    add_reference :equipment, :shops, foreign_key: true
  end
end
