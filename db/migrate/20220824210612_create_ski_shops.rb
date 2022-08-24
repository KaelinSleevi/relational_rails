class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name
      t.float :ratings
      t.boolean :is_open

      t.timestamps
    end
  end
end
