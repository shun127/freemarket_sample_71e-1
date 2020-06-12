class Item < ApplicationRecord
  has_many   :item_images,dependent: :destroy
  has_many   :comments,dependent: :destroy
  has_many   :favorites,dependent: :destroy
  belongs_to :category
  belongs_to :brand
  belongs_to :postage_payer,dependent: :destroy
  belongs_to :preparation_period,dependent: :destroy
  belongs_to :seller_item,class_name:"User"
  belongs_to :buyer_item,class_name:"User"

  
end
