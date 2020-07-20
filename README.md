https://gyazo.com/cb41013470b991520a1b2fe533d83a4b

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false, default: “”|
|encrypted_password|string|null: false, default: “”|
|reset_password_token|string|
|reset_password_sent_at|datetime|
|remember_created_at|datetime|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|post_code|string|null: false|
|prefecture_code|string|null: false|
|city|string|null: false|
|house_number|string|null:false|
|building_name|string|
|phone_number|string|

### Association
- has_one :credit_card,dependent: :destroy
- has_many :seller_items,class:"items"
- has_many :buyer_items,class:"items"

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|string|null: false|
|item_introduction|text|null: false|
|condition|string|null: false|
|seller_id|references|null: false, foreign_key: true|
|buyer_id|references|foreign_key: true|
|category_id|string|null: false, foreign_key: true|
|brand_id|string|foreign_key: true|
|postage_payers|string|null:false|
|perfecture_id|string|null: false, foreign_key:true|
|preparation_period|string|null: false|

### Association
- has_many :item_images,dependent: :destroy
- belongs_to :category
- belongs_to :brand
- belongs_to :seller_item,class_name:"User"
- belongs_to :buyer_item,class_name:"User"

## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|customer_id|string|null: false|
|card_id|string|null: false|
|user_id|references|null: false, foreign_key: true|

### Association
belongs_to :user

## categoriesテーブル(gem:ancestry)
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|

### Association
- has_many :items

## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null:false, foreign_key:true|
|src|string|null:false|

### Association
- belongs_to :item