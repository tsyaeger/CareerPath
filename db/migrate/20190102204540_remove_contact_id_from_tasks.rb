class RemoveContactIdFromTasks < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :contact_id, :integer
  end
end
