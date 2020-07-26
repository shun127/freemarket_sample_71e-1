class ItemsController < ApplicationController
  before_action :set_info, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.includes(:item_images) 
    @parents = Category.roots
    @item = Item.new
    @item.item_images.build
  end

  def show

    @item = Item.find(params[:id])
    
    # 実装中、残しておく7/24木下
    # # @card = CreditCard.find(params[:id]
    # # @card = CreditCard.find_by(user_id: current_user.id)
    # # card = CreditCard.find_by(user_id: current_user.id)
    # # if @card.present?
    # #   card_data(@card)
    # #   @card = CreditCard.find_by(user_id: current_user.id)
    # if @card.blank?
    #   redirect_to  new_credit_card_path
    # else
    #   redirect_to new_credit_card_path
    # end
   
  end

  def new
    @item = Item.new
    @images = @item.item_images.build

  end

  def category_children
    @category_children = Category.find(params[:parent_name]).children
  end
  def category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:success] = "出品が完了しました！"
      redirect_to root_path
    else
      flash[:alert] = "入力に誤りがあります。もう一度入力してください。"
      @images = @item.item_images.build
      render :new 
      @categories = Category.all
      @category_parent_array = ["---"]
      Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
      
      end
    end
  end

  def edit
  end

  def update
    if@item.update(item_params) 
      flash[:success_update] = "変更が完了しました！"
      redirect_to root_path
      else
        flash[:alert] = "入力に誤りがあります。もう一度入力してください。"
        redirect_to action: :edit
    end
  end
  
  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  require 'payjp'

  def purchase_index
    
    card = CreditCard.find_by(user_id: current_user.id)
    
    if card.blank?

      redirect_to pay_credit_cards_path
    else
      # セキュリティのためdotenvの.envからcredentials.ymlに記述変更。環境変数は一旦残しておきます7/24木下
      # Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      Payjp.api_key = Rails.application.credentials[:PAYJP][:secret_access_key]
      
      customer = Payjp::Customer.retrieve(card.customer_id)
      
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    card = CreditCard.find_by(user_id: current_user.id)
    # セキュリティのためdotenvの.envからcredentials.ymlに記述変更。環境変数は一旦残しておきます7/24木下
    # Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp.api_key = Rails.application.credentials[:PAYJP][:secret_access_key]

    @item = Item.find_by(params[:id])
    Payjp::Charge.create(
    amount: @item.price,
    customer: card.customer_id, 
    currency: 'jpy', 
  )
  redirect_to "/items/done/#{params[:id]}"
  end
  
  def done
    # find_byだと値がうまく取れないので一旦コメントアウトしております。問題なければ最終的に消す7/24木下
    # @item = Item.find_by(params[:id])
    @item = Item.find(params[:id])
    @item.buyer_id = current_user.id
    if @item.save then

    else
      redirect_to item_path(params[:id])
    end
  end

  

  def purchase_temporary
    card = CreditCard.find_by(user_id: current_user.id)
    if card.blank?
      flash[:card] = "購入する際は クレジットカードを登録してください。"
      redirect_to pay_credit_cards_path
    else
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
      @item = Item.find(params[:id])
    end
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
    card = CreditCard.where(user_id: current_user.id).first
    # セキュリティのためdotenvの.envからcredentials.ymlに記述変更。環境変数は一旦残しておきます。7/24木下
    # Payjp.api_key = '*************'
    Payjp.api_key = Rails.application.credentials[:PAYJP][:secret_access_key]

    if card then
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  #マイページフロント実装コードレビュー確認のための仮です。皆川6/10
  def mypage_card_create

  end


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
      item_images_attributes: [:id, :item_id, :src, :_destroy],
    )
    .merge(seller_id: current_user.id, )
  end

  def set_info
    @categories = Category.all
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
    @category_parent_array << parent.name
    end
  end

  def set_item
    @item =Item.find(params[:id])
  end
end