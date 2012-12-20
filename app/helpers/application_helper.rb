module ApplicationHelper
  def get_user
    session[:user]
  end
end
