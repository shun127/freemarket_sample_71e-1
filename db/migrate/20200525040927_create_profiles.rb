class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :first_name,                         null:false
      t.string :family_namename,                    null:false
      t.string :first_name_kana,                    null:false
      t.string :family_namename_kana,               null:false
      t.date :birth_year,                           null:false
      t.date :birth_month,                          null:false
      t.date :birth_day,                            null:false
      # t.references :user_id,null:false,foreign_key: true
      t.timestamps
    end
  end
end
