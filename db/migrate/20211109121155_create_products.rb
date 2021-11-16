class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :title
      t.string :desc
      t.string :categories
      t.integer :price

      t.timestamps
    end
  end
end
