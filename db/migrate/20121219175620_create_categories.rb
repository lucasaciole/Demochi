class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, null: false, limit: 70
      t.timestamps
    end

    #Indexes
    add_index :categories, :name, unique: true
  end
end
