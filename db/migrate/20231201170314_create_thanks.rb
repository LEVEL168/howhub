class CreateThanks < ActiveRecord::Migration[5.2]
  def change
    create_table :thanks do |t|
      t.integer :user_id
      t.integer :craft_id

      t.timestamps
    end
  end
end
