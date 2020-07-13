Rails.application.routes.draw do
  get 'credit_cards/new'
  get 'credit_cards/show'
  devise_for :users
  root "items#index"
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
      get  'purchase/:id'=>  'items#purchase', as: 'purchase'
      post 'pay/:id'=>   'items#pay', as: 'pay'
      get  'done'=>      'items#done', as: 'done'

      #商品購入のフロント実装コードレビュー確認のための仮ルーティングです。木下6/3
      # 'login''sign_up'は削除しました（deviseディレクトリに移動）木下6/15
      get  'purchase_temporary'

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
    end
    
    member do
      get 'category_children', defaults: { format: 'json' }
      get 'category_grandchildren', defaults: { format: 'json' }
    end
  end

  resources :categories, only: [:index, :show] do
    collection do
      get 'child_category'
      get 'grandchild_category'
    end
  end

  resources :credit_cards , only: [:new, :create, :destroy]
end
