class CreditCardsController < ApplicationController

  require "payjp"

  def new
    card = CreditCard.find_by(user_id: current_user.id)
  end

  def pay #payjpとCardのデータベース作成を実施します。
    Payjp.api_key = Rails.application.credentials[:PAYJP][:secret_access_key]

    if params['payjp-token'].blank?

      redirect_to  mypage_card_items_path
      
    else
      customer = Payjp::Customer.create(
      description: '登録テスト', #なくてもOK
      email: current_user.email, #なくてもOK
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) #念の為metadataにuser_idを入れましたがなくてもOKl
      @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to  mypage_card_items_path

      else
        redirect_to action: "pay"
      end
    end
  end

  def delete #PayjpとCardデータベースを削除します
    
    card = CreditCard.find_by(user_id: current_user.id)
    if card.blank?
    else
     Payjp.api_key = Rails.application.credentials[:PAYJP][:secret_access_key]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "new"
  end

  def show #Cardのデータpayjpに送り情報を取り出します
    card = CreditCard.find_by(user_id: current_user.id)
    if card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]

      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end
end
