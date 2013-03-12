# coding: utf-8

class LoginRequiredController < HurricaneController
  before_filter :require_login

  rescue_from CanCan::AccessDenied do |exp|
    redirect_to_login
  end
      
  protected
  def require_login
    unless logged_in?
      redirect_to_login
    end
  end

  def logged_in?
    !!current_user
  end

  def redirect_to_login
    redirect_to Rails.application.config.login_url, :alert => t('hurricane.alert.illegal_privilege') # TODO change this in your real production environment
  end
end
