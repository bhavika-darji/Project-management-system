class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.text :email
      t.string :role
      t.integer :experience
      t.boolean :status
      t.references :technology, foreign_key: true
      t.timestamps
    end
  end
end
