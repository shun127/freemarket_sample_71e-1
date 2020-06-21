class CreatePrefectureCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :prefecture_codes do |t|
      t.string :prefecture_code,                        null:false
      t.timestamps
    end
  end
end