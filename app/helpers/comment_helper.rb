module CommentHelper

  def self.getParentSymbol commentable
    if commentable.kind_of?(Comment)
      :comment
    elsif commentable.kind_of?(Idea)
      :ideas
    elsif commentable.kind_of?(Box)
      :boxes
    end
  end

  def self.getHigherParent comment
    comment = comment.commentable while comment.commentable.kind_of?(Comment)
    comment.commentable
  end

end
