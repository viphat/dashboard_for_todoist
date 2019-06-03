class AddSyncTokenToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :sync_token, :string
  end
end
