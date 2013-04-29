class AddIndexesAndNotNullToCategories < ActiveRecord::Migration
  def change
  	change_column :categories, :name, :string, null: false, limit: 70
  	add_index :categories, :name, unique: true
  end
end
