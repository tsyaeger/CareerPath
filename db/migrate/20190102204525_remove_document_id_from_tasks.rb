class RemoveDocumentIdFromTasks < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :document_id, :integer
  end
end
