class ChangeTitleColumnDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :contacts, :subject, nil
  end
end
