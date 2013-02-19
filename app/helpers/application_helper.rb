module ApplicationHelper
  def get_user
    unless session[:user].nil?
      User.find(session[:user])
    else
      nil
    end
  end
end
