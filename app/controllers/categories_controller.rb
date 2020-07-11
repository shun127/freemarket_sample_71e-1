class CategoriesController < ApplicationController
  def index
    @parents = Category.where(ancestry: nil)
  end

  def show
    @category = Category.find(params[:id])
    @items = Item.where(category_id: @category.subtree.ids).order("created_at DESC")
    # 本番でエラーが出るため修正
    # @items = Item.where(category_id: @category.subtree.ids).order("created_at DESC").page(params[:page]).per(8)
  end  
end

