class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :todoist_id, null: false, index: true, unique: true
      t.string :name, null: false
      t.integer :color, null: false
      t.boolean :is_deleted, null: false, default: false
      t.integer :user_id, null: false, index: true
      t.string :todoist_parent_id, index: true
      t.string :ancestry
      t.timestamps
    end
  end
end
