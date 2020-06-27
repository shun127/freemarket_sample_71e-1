class Item < ApplicationRecord
  has_many :item_images, dependent: :destroy 
  accepts_nested_attributes_for :item_images, allow_destroy: true

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  belongs_to :category
  belongs_to :brand, optional: true
  
  belongs_to :seller_item, class_name:"User", optional: true
  belongs_to :buyer_item, class_name:"User", optional: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture, dependent: :destroy
  belongs_to :brand, dependent: :destroy
  belongs_to :user

end
