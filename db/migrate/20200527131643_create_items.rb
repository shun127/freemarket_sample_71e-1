class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name,                         null:false
      t.string :price,                        null:false
      t.text   :item_introduction,            null:false
      t.string :condition,                    null:false
      t.references :seller,                   null:false,foreign_key:{to_table: :users}
      t.references :buyer,                    foreign_key:{to_table: :users}
      t.string :category_id,                  null:false,foreign_key:true
      t.string :brand_id,                     foreign_key:true
      t.string :postage_payers,               null:false
      t.string :prefecture_id,                null:false,foreign_key:true
      t.string :preparation_period,           null:false
      t.timestamps
    end
  end
end