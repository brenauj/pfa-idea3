class UsersController < ApplicationController
  def register
  end

  def view
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])

    if request.post?
      if params[:user][:password] == ""
        params[:user].delete(:password)
      end

      if @user.update_attributes(params[:user])
        redirect_to :action => :view, :id => @user
      end
    end
  end

  def delete
  end

  def list
  end
end
