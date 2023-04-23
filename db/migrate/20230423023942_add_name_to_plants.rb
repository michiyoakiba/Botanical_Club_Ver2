class AddNameToPlants < ActiveRecord::Migration[6.1]
  def change
    add_column :plants, :customer_id, :integer
  end
end
