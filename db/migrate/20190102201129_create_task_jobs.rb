class CreateTaskJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :task_jobs do |t|
      t.integer :task_id
      t.integer :job_id

      t.timestamps
    end
  end
end
