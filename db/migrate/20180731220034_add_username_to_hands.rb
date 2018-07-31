class AddUsernameToHands < ActiveRecord::Migration[5.2]
  def change
    add_column :hands, :username, :string
  end
end
