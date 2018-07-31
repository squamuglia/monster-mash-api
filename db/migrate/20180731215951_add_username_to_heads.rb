class AddUsernameToHeads < ActiveRecord::Migration[5.2]
  def change
    add_column :heads, :username, :string
  end
end
