class AddNotesToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :notes, :string
  end
end
