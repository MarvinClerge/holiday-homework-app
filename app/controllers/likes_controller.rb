class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @user = current_user
    @like = Like.find_or_create_by(post: @post, user: @user)

    redirect_to(request.env['HTTP_REFERER'])
  end
end
