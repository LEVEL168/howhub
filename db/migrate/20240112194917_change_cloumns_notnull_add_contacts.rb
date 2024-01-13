class ChangeCloumnsNotnullAddContacts < ActiveRecord::Migration[5.2]
  def change
    change_column_null :contacts, :subject, :string, false
  end
end
