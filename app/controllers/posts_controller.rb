class PostsController < ApplicationController
  def new
  end

  def create
    @post = Post.new(title: params[:post][:title], content: params[:post][:content], user: current_user)
    @post.views = 1

    if @post.save
      redirect_to(request.env['HTTP_REFERER'])
    else
      redirect_to(request.env['HTTP_REFERER'])
    end
  end

  def show
    @post = Post.find(params[:id])
    @post.views += 1
    @post.save
  end

  def edit
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to(request.env['HTTP_REFERER'])
    else
      flash[:error] = "Invalid changes"
      redirect_to(request.env['HTTP_REFERER'])
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end



end
