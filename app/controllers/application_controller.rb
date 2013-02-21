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

  def get_user
    unless session[:user].nil?
      begin
        User.find(session[:user])
      rescue
        session[:user] = nil
      end
    else
      nil
    end
  end

  def get_user_id
    session[:user]
  end

  def set_user(user)
    session[:user] = user.id
  end

  def clear_user
    session[:user] = nil
  end
end
