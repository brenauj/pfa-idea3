class IdeasController < ApplicationController
  def create
    if request.get?
      @idea = Idea.new
    elsif request.post?
      @idea = Idea.new params[:idea]
      if @idea.save
        redirect_to :action => :view, :id => @idea
      else
        redirect_to :action => :edit, :id => @idea
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

      if params[:idea][:name] == ""
        params[:idea].delete(:name)
      end

      if @idea.update_attributes(params[:idea])
        redirect_to :action => :view, :id => @idea
      end

    end
  end
end
