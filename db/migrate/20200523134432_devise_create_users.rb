# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      ## Database authenticatable


      t.string :nickname,           null: false, unique: true
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      
      t.timestamps null: false


      # profilesから移動6/14木下
      t.string :first_name,                         null:false
      t.string :family_name,                        null:false
      t.string :first_name_kana,                    null:false
      t.string :family_name_kana,                   null:false

      # 生年月日ですが、dateにするとカラムごとに0000/00/00の形しか受け付けないためinteger（整数）と修正（ユーザーはリストから選ぶ形式にしています）木下6/15。
      t.integer :birth_year,                           null:false
      t.integer :birth_month,                          null:false
      t.integer :birth_day,                            null:false

      # destinationsから移動6/14木下
      t.string :post_code,            null:false
      t.string :prefecture_code,      null:false
      t.string :city,                 null:false
      t.string :house_number,         null:false
      t.string :building_name

      ### お届け先の電話番号は任意というカリキュラム指定のため、電話番号はnullfalseをとる木下6/15
      t.string :phone_number

    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
