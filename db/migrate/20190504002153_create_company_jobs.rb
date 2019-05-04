class CreateCompanyJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :company_jobs do |t|
      t.integer :company_id
      t.integer :job_id

      t.timestamps
    end
  end
end
