class CreateLogins < ActiveRecord::Migration[5.2]
  def change
    create_table :logins do |t|
      t.string :logintype
      t.string :username
      t.text :password

      t.timestamps
    end
  end
end
