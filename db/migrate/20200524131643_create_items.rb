class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name,                         null:false
      t.string :price,                        null:false
      t.text   :item_introduction,            null:false
      # t.references :category_id,            null:false,foreign_key:true
      # t.references :brand_id,               null:false,foreign_key:true
      # t.references :item_condition_id,      null:false,foreign_key:true
      # t.references :postage_payers_id,      null:false,foreign_key:true
      # t.references :preparation_period_id,  null:false,foreign_key:true
      t.string :trading_status,               null:false
      t.string :deal_closed_data
      t.timestamps
    end
  end
end
