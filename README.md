## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|password|string|null: false|
|email|string|null: false, unique: true|

### Association
- has_one :profil,dependent: :destroy
- has_one :destination,dependent: :destroy
- has_one :credit_card,dependent: :destroy
- has_many :comments,dependent: :destroy
- has_many :favorites,dependent: :destroy
- has_many :seller_items,class:"items"
- has_many :buyer_items,class:"items"

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|string|null: false|
|item_introduction|text|null: false|
|category_id|references|null: false, foreign_key: true|
|brand_id|references|null: false, foreign_key: true|
|condition|enum|null: false|
|item_imageas_id|references|null: false, foreign_key: true|
|postage_payers_id|references|null:false, foreign_key: true|
|preparation_period_id|references|null: false, foreign_key: true|
|deal_closed_data|string| -|
|seller_id|references|null: false, foreign_key: true|
|buyer_id|references|foreign_key: true|


### Association
- has_many :item_images,dependent: :destroy
- has_many :comments,dependent: :destroy
- has_many :favorites,dependent: :destroy
- belongs_to :category
- belongs_to :brand
- belongs_to :postage_payer,dependent: :destroy
- belongs_to :preparation_period,dependent: :destroy
- belongs_to :seller_item,class_name:"User"
- belongs_to :buyer_item,class_name:"User"

## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false, unique:true|
|expration_year|integer|null: false|
|expiration_month|integer|null: false|
|security_code|integer|null: false|
|user_id|references|null: false, foreign_key: true|

### Association
belongs_to :user

## destinationsテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|post_code|integer|null: false|
|prefecture_code|string|null: false|
|city|string|null: false|
|house_number|string|null:false|
|building_name|string| -|
|phone_number|integer|null: false|
|user_id|references|null:false, foreign_key: true|

### Association
belongs_to :user

## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|birth_year|date|null: false|
|birth_month|date|null: false|
|birth_day|date|null: false|
|user_id|references|null:false, foreign_key: true|
|introduction|text|

### Association
belongs_to :user

## categoriesテーブル(gem:ancestry)
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null:false|

### Association
- has_many :items

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string| -|

### Association
- has_many :items

## postage_payersテーブル
|Column|Type|Options|
|------|----|-------|
|postage_payers|string|null:false|

### Association
- has_many :items

## preparation_periodテーブル
|Column|Type|Options|
|------|----|-------|
|preparation_period|string|null:false|

### Association
- has_many :items

## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null:false, foreign_key:true|
|url|string|null:false|

### Association
- belongs_to :item

## commentsテーブル(中間テーブル)
|Column|Type|Options|
|------|----|-------|
|comment|text|null:false|
|user_id|references|null:false, foreign_key: true|
|item_id|references|null:false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## favoritesテーブル(中間テーブル)
|Column|Type|Options|
|------|----|-------|
|favorites|string|null:false|
|user_id|references|null:false, foreign_key: true|
|item_id|references|null:false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
