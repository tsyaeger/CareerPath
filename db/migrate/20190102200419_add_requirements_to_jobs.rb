class AddRequirementsToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :requirements, :string
  end
end
