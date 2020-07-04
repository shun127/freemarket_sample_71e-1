class ItemsController < ApplicationController
  # 未ログインのユーザーをリダイレクトさせる。（下記before actionも参照）、サーバーサイド全て完了したらコメントアウト外す。6/15木下
  # before_action :move_to_index, except: [:index, :show]

  before_action :set_item, only: [:show, :edit, :destroy]

  def index
    @items = Item.all.includes(:item_images)
    @parents = Category.where(ancestry: nil)
  end

  def show
  end

  def new
    @item = Item.new
    @images = @item.item_images.build
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
    @category_parent_array << parent.name
    end
  end

  def category_children
    @category_children = Category.find(params[:parent_name]).children
  end
  def category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def create
    # binding.pry
    @item = Item.new(item_params)
    if @item.save!
      flash[:success] = "出品が完了しました！"
      redirect_to root_path
    else
      flash[:alert] = "入力に誤りがあります。もう一度入力してください。"
      redirect_to new_item_path
    end
  end

  def edit
  end

  def update
  end
  
  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def purchase
  end

  def pay
  end

  def done
  end

  def purchase_temporary
  end

  def item_details
  end

  def member_done
  end

  #マイページフロント実装コードレビュー確認のための仮です。皆川6/10
  def mypage_exhibiting
  end
  #マイページフロント実装コードレビュー確認のための仮です。皆川6/10
  def mypage_logout
  end
  #マイページフロント実装コードレビュー確認のための仮です。皆川6/10
  def mypage_card
  end
  #マイページフロント実装コードレビュー確認のための仮です。皆川6/10
  def mypage_card_create
  end
  # 'login''sign_up'は削除しました（deviseディレクトリに移動）木下6/15


  # 未ログインのユーザーをリダイレクトさせる。（下記before actionも参照）、サーバーサイド「全て完了した」らコメントアウト外す。6/15木下
  # def move_to_index
  #   redirect_to action: :index unless user_signed_in?
  # end

  private

  def item_params
    params.require(:item).permit(
      :name, 
      :price, 
      :item_introduction, 
      :condition,
      :seller,
      :category_id,
      :brand_id,
      :postage_payers,
      :preparation_period,
      :prefecture_id,
      item_images_attributes: [:id, :item_id, :src],
    )
    .merge(seller_id: current_user.id, )
  end

  def set_item
    @item =Item.find(params[:id])
  end
end