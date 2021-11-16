class DropOldCategoriesFromProducts < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :categories
  end
end
