class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.belongs_to :conversation, index: true, foreign_key: true
      t.string :text
      t.timestamps
    end
  end
end
