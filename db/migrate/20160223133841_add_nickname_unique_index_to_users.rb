class AddNicknameUniqueIndexToUsers < ActiveRecord::Migration[5.0]
  def change
    add_index :users, :nickname, unique: true
  end
end
