class CreateTaskContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :task_contacts do |t|
      t.integer :task_id
      t.integer :contact_id

      t.timestamps
    end
  end
end
