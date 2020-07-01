class CategoriesController < ApplicationController
  def index
    @parents = Category.where(ancestry: nil)
  end

  def show
    # binding.pry
    @items = Item.all
   
    @items = Item.all.includes(:item_images)
    # @item = Item.find(params[:id])
    @category = Category.find(params[:id])
  end  
end


    # @item_images = Item_image.all