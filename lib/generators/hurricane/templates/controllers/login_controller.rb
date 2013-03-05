class LoginController < ApplicationController
  def index
    render :layout => false
  end

  def new
    name = params[:login][:name].downcase
    user = <%=human_name%>.where("email = ?", name)
    if user.exists? 
      session[:current_user_id] = user.first.id
      redirect_to "/"
    else
      flash[:alert] = "Username not exists"
      render "index", :layout => false
    end
  end
  
  def logout
    @_current_user = nil
    session[:current_user_id] = nil
    redirect_to login_url
  end
end
