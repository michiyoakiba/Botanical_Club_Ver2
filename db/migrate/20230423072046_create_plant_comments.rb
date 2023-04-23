class CreatePlantComments < ActiveRecord::Migration[6.1]
  def change
    create_table :plant_comments do |t|
      t.text :comment
      t.integer :customer_id
      t.integer :plant_id
      t.timestamps
    end
  end
end
