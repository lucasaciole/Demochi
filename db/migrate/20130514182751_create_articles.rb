class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      # Data.
      t.string  :title,         null: false, limit: 150,  default: ""
      t.text    :body,          null: false,              default: ""
      t.boolean :home_headline, null: false,              default: false
      t.string  :image,        null: false
      t.timestamps
    end

    add_index :articles, :title, unique: true
  end
end
