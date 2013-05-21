class CreateTaggedResources < ActiveRecord::Migration
  def up
    create_table :tagged_resources do |t|
      t.belongs_to  :resource,      :null => false, :references => nil
      t.string      :resource_type, :null => false
      t.belongs_to  :tag,           :null => false, :on_delete => :cascade
      t.timestamps
    end
  end

  def down
    drop_table :tagged_resources
  end
end
