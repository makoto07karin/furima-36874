class ApplicationController < ActionController::Base
  before_action :basic_auth
  #before_action :authenticate_user!#1
  before_action :configure_permitted_parameters, if: :devise_controller?#2

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username ==  ENV["BASIC_AUTH_USER"] && password ==  ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def configure_permitted_parameters#2
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :name, :family_kana, :kana, :date])
  end


end
#1ここで必要な情報を入力しないとログインできないよにした！by〜ChatAppのユーザー管理機能を実装しよう 解答4〜
#1ユーザー管理機能実装時にはまた必要がないので、一度このままにしておくこと10/7
#2ここでストロングパラメーターを記述しているbyChatAppのユーザー管理機能を実装しよう 解答5