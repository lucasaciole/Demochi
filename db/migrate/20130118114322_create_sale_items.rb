class CreateSaleItems < ActiveRecord::Migration
  def change
    create_table :sale_items do |t|
      t.float       :product_price, null: false, default: 0
      t.integer     :quantity,      null: false, default: 0

      t.belongs_to  :sale,          null: false
      t.belongs_to  :product,       null: false

      t.timestamps
    end

    add_foreign_key :sale_items, :products
    add_foreign_key :sale_items, :sales
  end
end
  