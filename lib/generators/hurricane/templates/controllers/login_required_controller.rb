# coding: utf-8

class LoginRequiredController < ApplicationController
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
    if Rails.env.production? 
      redirect_to '/login', :alert => '权限错误!' # TODO change this in your real production environment
    else
      redirect_to '/login', :alert => '权限错误！'
    end

  end
end
