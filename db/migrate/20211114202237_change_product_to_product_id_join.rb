class ChangeProductToProductIdJoin < ActiveRecord::Migration[6.1]
  def self.up
    rename_column :categories_products, :product, :product_id
  end
end
