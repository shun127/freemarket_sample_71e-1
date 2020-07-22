Rails.application.routes.draw do

  devise_for :users
  root "items#index"
  #クレカ登録削除機能 高松
  resources :credit_cards, only: [:new, :show] do
    collection do
      post 'show', to: 'credit_cards#show'
      post 'pay', to: 'credit_cards#pay'
      post 'delete', to: 'credit_cards#delete'
    end
  end
  
  resources :items do
    collection do
      get 'category_children', defaults: { format: 'json' }
      get 'category_grandchildren', defaults: { format: 'json' }

      # 商品購入のルーティングですが、idをつけたいので、ルーティング変更7/20木下
      # get  'purchase_temporary'

      #マイページフロント実装コードレビュー確認のための仮ルーティングです。皆川6/10
      get  'mypage'
      get  'mypage_card'
      get  'mypage_logout'
      get  'mypage_exhibiting'
      get  'mypage_card_create'

      #商品詳細ページのフロント実装コードレビュー確認のための仮ルーティングです。伊藤6/4
      get  'member_done'


      # カテゴリからの商品一覧ページのルーティング6/29木下
      get  'category_index'

      # 購入機能のルーティングです7/20
      get 'purchase_index/:id', to: 'items#purchase_index'
      post 'pay/:id', to: 'items#pay'
      get 'done/:id', to: 'items#done'


    end
    
    member do
      get 'category_children', defaults: { format: 'json' }
      get 'category_grandchildren', defaults: { format: 'json' }
      
      # idをつけたいので、ルーティングをcollection doより移動7/20木下
      get  'purchase_temporary' 
    end
  end

  resources :categories, only: [:index, :show] do
    collection do
      get 'child_category'
      get 'grandchild_category'
    end
  end

end
