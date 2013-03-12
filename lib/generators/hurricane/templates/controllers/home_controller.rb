# coding: utf-8
class HomeController < LoginRequiredController
  def index
    render :layout => 'application'
  end
end
