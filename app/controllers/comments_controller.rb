class CommentsController < ApplicationController
  def new
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to post_path(@comment.post)
    else
      redirect_to(request.env['HTTP_REFERER'])
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end
end
