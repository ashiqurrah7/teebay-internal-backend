class CreateCategoriesProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :categories_products, :id => false do |t|
      t.integer :category_id
      t.integer :product
    end
  end
end
