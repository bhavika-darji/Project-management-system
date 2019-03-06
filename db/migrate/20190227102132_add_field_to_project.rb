class AddFieldToProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :employee, :text
  end
end
