class CategoriesController < ApplicationController
  def index
    @parents = Category.where(ancestry: nil)
  end

  def show
    @category = Category.find(params[:id])
    @items = Item.where(category_id: @category.subtree.ids).order("created_at DESC").page(params[:page]).per(8)
  end  

  def new
    @children = Category.find(params[:parent_id]).children
    respond_to do |format|
      format.html
      format.json
    end
  end

  def set_parents
    @parents = Category.where(ancestry: nil)
  end

end

