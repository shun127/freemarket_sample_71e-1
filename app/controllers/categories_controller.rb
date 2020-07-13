class CategoriesController < ApplicationController
  def index
    @parents = Category.where(ancestry: nil)
  end

  def show
    @category = Category.find(params[:id])
    @items = Item.where(category_id: @category.subtree.ids).order("created_at DESC").page(params[:page]).per(8)
  end  
end

