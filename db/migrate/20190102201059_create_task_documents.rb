class CreateTaskDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :task_documents do |t|
      t.integer :task_id
      t.integer :document_id

      t.timestamps
    end
  end
end
