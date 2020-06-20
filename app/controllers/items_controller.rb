class ItemsController < ApplicationController
  # 未ログインのユーザーをリダイレクトさせる。（下記before actionも参照）、サーバーサイド全て完了したらコメントアウト外す。6/15木下
  # before_action :move_to_index, except: [:index, :show]

  def index
    # @items = Item.all
    @items = Item.includes(:item_images)
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end
  
  def destroy
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
end
