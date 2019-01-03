class RemoveJobIdFromTasks < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :job_id, :integer
  end
end
