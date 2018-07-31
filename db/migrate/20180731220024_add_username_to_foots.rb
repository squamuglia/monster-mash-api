class AddUsernameToFoots < ActiveRecord::Migration[5.2]
  def change
    add_column :foots, :username, :string
  end
end
