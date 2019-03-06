class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.string :pm
      t.integer :budget
      t.references :client, foreign_key: true
      t.references :technology, foreign_key: true
      t.timestamps
    end
  end
end
