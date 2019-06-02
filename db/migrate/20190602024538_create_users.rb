class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :todoist_user_id, null: false, index: true
      t.string  :todoist_access_token, null: false
      t.string  :email, null: false, unique: true, index: true
      t.string  :full_name, null: false
      t.string  :avatar
      t.timestamps
    end
  end
end
