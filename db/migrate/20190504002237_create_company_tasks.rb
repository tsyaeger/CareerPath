class CreateCompanyTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :company_tasks do |t|
      t.integer :company_id
      t.integer :task_id

      t.timestamps
    end
  end
end
