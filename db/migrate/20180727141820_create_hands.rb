class CreateHands < ActiveRecord::Migration[5.2]
  def change
    create_table :hands do |t|
      t.string :url
      t.integer :user_id

      t.timestamps
    end
  end
end
