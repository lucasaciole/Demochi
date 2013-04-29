class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.references :user, 	null: false
      t.float :total_price, null: false

      t.timestamps
    end
    add_index :sales, :user_id
    add_foreign_key :sales, :users
  end
end
