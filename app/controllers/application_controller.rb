class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def authenticate_user
    if @current_user == nil
      flash[:notice] = t('notice.login_needed')
      redirect_to new_session_path
    end
  end

  def login_check
    if current_user.nil?
      redirect_to root_url, danger: "ログインしてください"
    end
  end

end
