class UsersController < ApplicationController
  def register
    if request.post?
      @user = User.new(params[:user])
      @user.role = User::User
      if @user.save
        redirect_to :action => :view, :id => @user
      end
    else
      @user = User.new
    end
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
    @user = User.find(params[:id])

    if params[:confirm]
      @user.delete
      redirect_to :action => :list
    end
  end

  def list
    @users = User.find(:all)
  end
end
