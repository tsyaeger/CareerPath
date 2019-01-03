# frozen_string_literal: true

class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name, null: false
      t.string :workplace
      t.string :linkedin
      t.string :phone
      t.string :email
      t.boolean :reference, default: false

      t.timestamps
    end
  end
end
