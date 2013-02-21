class BoxesController < ApplicationController

  before_filter :require_login, :except => [:list, :view]
  before_filter :require_permission, :except => [:create, :list, :view]

  def create
    if request.post?
      @box = Box.new(params[:box])
      @box.user = get_user
      if @box.save
        redirect_to :action => :view, :id => @box
      end
    else
      @box = Box.new
    end
  end

  def require_permission
    user = get_user
    if user != Box.find(params[:id]).user && user.role != 1 && user.role != 2
      flash[:error] = ["You don't have permission to edit or delete this box"]
      redirect_to :action => :view, :id => Box.find(params[:id])
    end
  end

  def edit
    @box = Box.find(params[:id])

    if request.post?
      if @box.update_attributes(params[:box])
        redirect_to :action => :view, :id => @box.id
      end
    end
  end

  def list
    @boxes = Box.all
  end

  def view
    @box = Box.find(params[:id])
  end

  def delete
    @box = Box.find(params[:id])

    if params[:confirm]
      @box.delete
      ideas = Idea.find_all_by_box_id params[:id]
      ideas.each do |i|
        i.delete
      end
      redirect_to :action => :list
    end
  end
end
