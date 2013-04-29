class SpecifyUserDataDetails < ActiveRecord::Migration
  def change
    change_column :users, :name, :string, limit: 50, default: ""
    change_column :users, :email, :string, limit: 50, default: ""
  end
end
