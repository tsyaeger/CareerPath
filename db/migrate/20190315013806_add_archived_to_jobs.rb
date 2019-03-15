class AddArchivedToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :archived, :boolean
  end
end
