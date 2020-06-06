class CreateItemImages < ActiveRecord::Migration[5.2]
  def change
    create_table :item_images do |t|
      t.references :item_id          null:false,foreign_key:true
      t.string :url                       null:false
      t.timestamps
    end
  end
end
