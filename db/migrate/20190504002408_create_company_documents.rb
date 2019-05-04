class CreateCompanyDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :company_documents do |t|
      t.integer :company_id
      t.integer :document_id

      t.timestamps
    end
  end
end
