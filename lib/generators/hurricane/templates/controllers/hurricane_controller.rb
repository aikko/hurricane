class HurricaneController < ActionController::Base
  protect_from_forgery

  protected
  def current_user
    @_current_user ||= session[:current_user_id] && <%=human_name%>.find_by_id(session[:current_user_id])
  end

  def t_type
    if respond_to? "record_type"
      t 'hurricane.type.' + record_type
    else
      ""
    end
  end
end
