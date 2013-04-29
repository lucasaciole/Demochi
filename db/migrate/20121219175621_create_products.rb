class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      # Data
      t.string  :code,         null: false, limit: 15
      t.text    :description,  null: false
      t.float   :price,        null: false
      t.string  :image
      
      t.timestamps
      
      # Relationships
      t.references :category, null: false
    end
    
    # Indexes
    add_index :products, :code, unique: true
    
    # Foreign keys
    add_foreign_key :products, :categories
  end
end
