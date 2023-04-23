class RemoveNameFromPlants < ActiveRecord::Migration[6.1]
  def change
    remove_column :plants, :user_id, :integer
  end
end
