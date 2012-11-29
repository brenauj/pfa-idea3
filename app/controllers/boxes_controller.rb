class BoxesController < ApplicationController
  def create
    if request.post?
      @box = Box.new(params[:box])
      if @box.save
        redirect_to :action => :view, :id => @box
      end
    else
      @box = Box.new
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
      redirect_to :action => :list
    end
  end
end
