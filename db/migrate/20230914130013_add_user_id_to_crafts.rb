class AddUserIdToCrafts < ActiveRecord::Migration[5.2]
  def change
    add_column :crafts, :user_id, :integer
  end
end
