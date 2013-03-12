class HurricaneController < ApplicationController
  protect_from_forgery

  protected
  def current_user
    @_current_user ||= session[:current_user_id] && <%=human_name%>.find_by_id(session[:current_user_id])
  end

  def t_type
    if respond_to? "record_type"
      t 'hurricane.type.' + record_type.to_s
    else
      ""
    end
  end
end
