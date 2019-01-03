# frozen_string_literal: true

class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.string :title
      t.string :description
      t.string :url
      t.string :doctype

      t.timestamps
    end
  end
end
