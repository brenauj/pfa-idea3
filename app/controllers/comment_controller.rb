class CommentController < ApplicationController
  before_filter :require_login, :except => [ :view ]

  def redirector controller=nil,id=nil,action=:view
    id ||= CommentHelper.getHigherParent @comment
    controller ||= (CommentHelper.getParentSymbol id)
    redirect_to :controller => controller, :action => action, :id => id
  end

  def create
    if request.get?
      @comment = Comment.new
    elsif request.post?
      @comment = Comment.new params[:comment]
      @comment.user = get_user
      (redirector) if @comment.save
    end
  end

  def view
    @comment = Comment.find(params[:id])
  end

  def moderate
    @comment = Comment.find(params[:id])
    @comment.moderated = true
    @comment.moderator_id = params[:moderator_id]
    @comment.save
    redirector
  end

  def edit
    @comment = Comment.find(params[:id])
    
    (redirector) if @comment.user != (get_user) and (get_user).role == User::User
    if request.post?
      @comment.update_attributes(params[:comment])
      redirector
    end
  end

  def delete
    @comment = Comment.find(params[:id])

    if request.post? and params[:confirm]
      id = CommentHelper.getHigherParent @comment
      controller = CommentHelper.getParentSymbol id
      @comment.delete
      @comment.comments.each do |c|
        c.delete
      end
      if controller
        redirector controller, id
      end
    end
  end

end
