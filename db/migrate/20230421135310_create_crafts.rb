class CreateCrafts < ActiveRecord::Migration[5.0]
  def change
    create_table :crafts do |t|
      t.string :title
      t.text :caption
      t.string :image

      t.timestamps
    end
  end
end
