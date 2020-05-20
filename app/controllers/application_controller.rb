class ApplicationController < ActionController::Base
  # Basic認証によるログインの要求を全てのコントローラーで行う
  # ルーティング設定後にBasic認証のコードを改良します(5/18)。木下
  before_action :basic_auth

  
  private

  # Basic認証の定義
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end
  end

end
