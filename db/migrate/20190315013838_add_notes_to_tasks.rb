class AddNotesToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :notes, :string
  end
end
