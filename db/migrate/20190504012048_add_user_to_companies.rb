class AddUserToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :user_id, :integer
    add_index :companies, :user_id
  end
end
