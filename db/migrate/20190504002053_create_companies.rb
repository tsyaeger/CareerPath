class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :description
      t.string :website
      t.string :notes

      t.timestamps
    end
  end
end
