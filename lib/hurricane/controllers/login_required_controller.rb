# coding: utf-8
module Hurricane
  module Controllers
    class LoginRequiredController < ApplicationController
      before_filter :require_login

      rescue_from CanCan::AccessDenied do |exp|
        if Rails.env.production? 
          redirect_to 'https://udb.hiido.com/index.php'
        else
          redirect_to '/login', :alert => '权限错误！'
        end
      end
      
      private
      def require_login
        unless logged_in?
          if Rails.env.production? 
            redirect_to 'https://udb.hiido.com/index.php'
          else
            redirect_to '/login'
          end
        end
      end

      def logged_in?
        !!current_user
      end
    end
  end
end
