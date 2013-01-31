class CommentController < ApplicationController
  before_filter :require_login, :except => [ :view ]

  def create
    if request.get?
      @comment = Comment.new
    elsif request.post?
      @comment = Comment.new params[:comment]
      @comment.user = session[:user]
      if @comment.save
        id = CommentHelper.getHigherParent @comment
        redirect_to :controller => (CommentHelper.getParentSymbol id), :action => :view, :id => id
      end
    end
  end

  def view
    @comment = Comment.find(params[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
    id = CommentHelper.getHigherParent @comment
    redirect_to :controller => (CommentHelper.getParentSymbol id), :action => :view, :id => id if @comment.user != session[:user] and session[:user].role == User::User
    if request.post?
      @comment.update_attributes(params[:comment])
      redirect_to :controller => (CommentHelper.getParentSymbol id), :action => :view, :id => id
    end
  end

  def delete
    @comment = Comment.find(params[:id])

    if request.post? and params[:confirm]
      id = CommentHelper.getHigherParent @comment
      sym = CommentHelper.getParentSymbol id
      @comment.delete
      @comment.comments.each do |c|
        c.delete
      end
      if sym
        redirect_to :action => :view, :controller => sym, :id => id
      end
    end
  end

end
