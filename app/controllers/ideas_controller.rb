class IdeasController < ApplicationController
  before_filter :require_login, :except => [ :view ]
  before_filter :check_user, :only => [ :delete, :edit ]

  include ApplicationHelper

  def check_user
    user = get_user
    if (user.role == User::User) and (user != Idea.find(params[:id]).user)
      add_error("You don't have the rights for that")
      redirect_to :action => :view, :id => params[:id]
    end
  end

  def create
    if request.get?
      @idea = Idea.new
      @idea.status = Idea::NONE
    elsif request.post?
      @idea = Idea.new params[:idea]
      if params[:idea][:status] == nil
        @idea.status = Idea::NONE
      end
      @idea.user = get_user
      if @idea.save
        redirect_to :action => :view, :controller => :boxes, :id => @idea.box_id
      else
        add_error @idea.errors.messages.to_s
      end
    end
  end

  def view
    @idea = Idea.find(params[:id])
  end

  def delete
    @idea = Idea.find(params[:id])
    if request.post? and params[:confirm]
      @idea.delete
      redirect_to :controller => :boxes, :action => :view, :id => @idea.box
    end
  end

  def edit
    @idea = Idea.find(params[:id])
    if request.post?

      if @idea.update_attributes(params[:idea])
        redirect_to :controller => :boxes, :action => :view, :id => @idea.box
      end

    end
  end
end
