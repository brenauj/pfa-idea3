class ApplicationController < ActionController::Base
  protect_from_forgery

  def require_login
    if session[:user].nil?
      redirect_to :controller => :users, :action => :login
    end
  end

  protected
  
  def add_warning(what)
    flash[:warning] ||= []
    flash[:warning] << what
  end

  def add_error(what)
    flash[:error] ||= []
    flash[:error] << what
  end    
end
