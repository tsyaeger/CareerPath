# frozen_string_literal: true

class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :company
      t.string :position
      t.string :url
      t.datetime :date_posted, null: false, default: Time.now
      t.string :job_desc
      t.string :co_desc
      t.boolean :applied, default: false
      

      t.timestamps
    end
  end
end
