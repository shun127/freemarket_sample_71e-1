class ApplicationController < ActionController::Base
  # Basic認証によるログインの要求を全てのコントローラーで行う
  before_action :basic_auth, if: :production?
  
  # CSRF対策
  protect_from_forgery with: :exception

  # sign_upアクションに対して「nickname」キーをパラメーターで許可する6/14木下
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  private

  # 「production?」メソッドの定義。現在の環境が本番環境ならtrue、そうでないならfalse。「if: :production?」の記述により本番環境のみでbasic_authメソッドの実行 5/20木下
  def production?
    Rails.env.production?
  end

  # Basic認証の定義
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  # sign_upアクションに対して各キーをパラメーターで許可する6/14木下
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name,:family_name, :first_name_kana, :family_name_kana, :birth_year, :birth_month, :birth_day, :post_code, :prefecture_code, :city, :house_number, :building_name, :phone_number])
  end

end
