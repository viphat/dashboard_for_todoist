class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :todoist_id, null: false, index: true, unique: true
      t.string  :todoist_access_token, null: false, unique: true
      t.string  :email, null: false, index: true, unique: true
      t.string  :full_name, null: false
      t.string  :avatar
      t.timestamps
    end
  end
end
