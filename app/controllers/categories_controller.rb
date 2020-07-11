class CategoriesController < ApplicationController
  def index
    @parents = Category.where(ancestry: nil)
  end

  def show
    @category = Category.find(params[:id])
    @items = Item.where(brand_id: @brand.subtree.ids).order("created_at DESC").page(params[:page]).per(8)
  end  
end

