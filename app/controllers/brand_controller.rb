class BrandController < ApplicationController
  def index
    @brands = Brand.all
  end

  def show
    # @brand = Brand.find(params[:id])
    # @items = Item.where(brand_id: @brand.subtree.ids).order("created_at DESC").page(params[:page]).per(8)
  end  
end
