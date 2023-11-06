class AddProfileImageToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile_image, :string, default: "NoImage.jpg"
  end
end
