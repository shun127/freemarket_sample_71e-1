class CategoriesController < ApplicationController
  def index
    @parents = Category.where(ancestry: nil)
  end

  def show
    # binding.pry
    @items = Item.all
    # @item_images = Item_image.all
    # @item = Item.find(params[:id])
    @category = Category.find(params[:id])
  end  
end
