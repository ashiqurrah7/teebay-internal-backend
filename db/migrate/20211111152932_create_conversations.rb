class CreateConversations < ActiveRecord::Migration[6.1]
  def change
    create_table :conversations do |t|
      t.references :first_user, null: false
      t.references :second_user, null: false

      t.timestamps
    end

    add_foreign_key :conversations, :users, column: :first_user_id
    add_foreign_key :conversations, :users, column: :second_user_id
  end
end
