class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.string :first_name,           null:false
      t.string :family_name,          null:false
      t.string :first_name_kana,      null:false
      t.string :family_name_kana,     null:false
      t.integer :post_code,           null:false
      t.string :prefecture_code,      null:false
      t.string :city,                 null:false
      t.string :house_number,         null:false
      t.string :building_name
      t.integer :phone_number,        null:false
      t.references :user,           null:false,foregin_key: true
      t.timestamps
    end
  end
end
