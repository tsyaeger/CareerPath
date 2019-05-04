class CreateCompanyContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :company_contacts do |t|
      t.integer :company_id
      t.integer :contact_id

      t.timestamps
    end
  end
end
