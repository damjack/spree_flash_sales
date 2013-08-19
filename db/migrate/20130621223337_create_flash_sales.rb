class CreateFlashSales < ActiveRecord::Migration
  def change
    create_table :spree_flash_sales do |t|
      t.datetime    :start_date, :end_date
      t.decimal     :price_cost,              :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.integer     :count_on_hand,           :default => 0, :null => false
      t.boolean     :active
      
      t.references  :product

      t.timestamps
    end
    
    add_index :spree_flash_sales, :product_id
  end
end
