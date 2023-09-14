class DropUserCrafts < ActiveRecord::Migration[5.2]
  def change
    drop_table :user_crafts do |t|
      t.integer :user_id
      t.integer :craft_id

      t.timestamps
    end
  end
end
