class UsersController < ApplicationController
  skip_before_action :authorized, only: [:index, :new, :create]

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_new_params)

    if params[:user][:password] == params[:user][:password_confirmation] && @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to signup_path
    end
  end

  def show
    @user = User.find(params[:id])
    @sorted_posts = @user.sorted_posts
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_edit_params)
      redirect_to user_path(@user)
    else
      redirect_to edit_user_path(@user)
    end
  end

  def destroy
    session.delete :user_id
    User.delete(params[:id])
    redirect_to users_path
  end

  private

  def user_new_params
    params.require(:user).permit(:username, :password, :name, :bio, :email, :color)
  end
  def user_edit_params
    params.require(:user).permit(:name, :bio, :email, :color)
  end
end
