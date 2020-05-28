class ApplicationController < ActionController::Base
  # # Basic認証によるログインの要求を全てのコントローラーで行う
  # # ルーティング設定後にBasic認証のコードを改良します(5/18)。木下
  # before_action :basic_auth, if: :production?
  
  # # CSRF対策
  # protect_from_forgery with: :exception
  
  # private

  # # # 「production?」メソッドの定義。現在の環境が本番環境ならtrue、そうでないならfalse。「if: :production?」の記述により本番環境のみでbasic_authメソッドの実行 5/20木下
  # # def production?
  # #   Rails.env.production?
  # # end

  # # Basic認証の定義
  # def basic_auth
  #   authenticate_or_request_with_http_basic do |username, password|
  #     username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
  #   end
  # end

end
