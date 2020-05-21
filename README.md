## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|password|string|null: false|
|email|string|null: false, unique: true|

### Association
- has_one :profiles
- has_one :destinations
- has_one :credit_cards
- has_meny :comment
- has_meny :favorites
- has_meny :seller_items
- has_meny :buyer_items

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|string|null: false|
|item_introduction|text|null: false|
|category_id|references|null: false, foreign_key: true|
|brand_id|references|null: false, foreign_key: true|
|item_condition_id|references|null: false, foreign_key: true|
|postage_payers_id|references|null:false, foreign_key: true|
|preparation_period_id|references|null: false, foreign_key: true|
|itemimage_id|references|null:false, foreign_key: true|
|trading_status|enum|null: false|
|deal_closed_data|timestamp| -|

### Association
- has_meny :itemimage
- has_meny :comment
- has_meny :tavorites
- belong_to :categories
- belong_to :item_condition
- belong_to :brands
- belong_to :postage_payers
- belong_to :preparation_period
- belong_to :seller_items
- belong_to :buyer_items

## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false, unique:true|
|expration_year|integer|null: false|
|expiration_month|integer|null: false|
|security_code|integer|null: false|
|user_id|references|null: false, foreign_key: true|

### Association
belong_to :user

## destinationsテーブル
|Column|Type|Options|
|------|----|-------|
|destination_first_name|string|null: false|
|destination_family_name|string|null: false|
|destination_first_name_kana|string|null: false|
|destination_family_name_kana|string|null: false|
|post_code|integer(7)|null: false|
|prefecture_code|string|null: false|
|city|string|null: false|
|house_number|string|null:false|
|building_name|string| -|
|phone_number|integer|null: false|
|user_id|references|null:false, foreign_key: true|

### Association
belong_to :user

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
belong_to :user

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_meny :items

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string| -|

### Association
- has_meny :items

## item_conditionテーブル
|Column|Type|Options|
|------|----|-------|
|item_condition|string|null: false|

### Association
- has_meny :items

## postage_payersテーブル
|Column|Type|Options|
|------|----|-------|
|postage_payers|string|null:false|

### Association
- has_meny :items

## preparation_periodテーブル
|Column|Type|Options|
|------|----|-------|
|preparation_period|string|null:false|

### Association
- has_meny :items

## itemimagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null:false, foreign_key:true|
|url|string|null:false|

### Association
- belong_to :item

## commentsテーブル(中間テーブル)
|Column|Type|Options|
|------|----|-------|
|comment|text|null:false|
|user_id|references|null:false, foreign_key: true|
|item_id|references|null:false, foreign_key: true|

### Association
- belong_to :user
- belong_to :item

## favoritesテーブル(中間テーブル)
|Column|Type|Options|
|------|----|-------|
|favorites|string|null:false|
|user_id|references|null:false, foreign_key: true|
|item_id|references|null:false, foreign_key: true|

### Association
- belong_to :user
- belong_to :item
