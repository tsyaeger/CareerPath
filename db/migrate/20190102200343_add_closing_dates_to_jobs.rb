class AddClosingDatesToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :closing_date, :datetime
  end
end
