class AddDiscordUsernameToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :discord_username, :string
    add_column :users, :paid, :boolean, full: false, default: false
  end
end
