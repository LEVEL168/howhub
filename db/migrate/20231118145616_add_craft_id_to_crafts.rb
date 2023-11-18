class AddCraftIdToCrafts < ActiveRecord::Migration[5.2]
  def change
    add_column :crafts, :craft_id, :integer
  end
end
