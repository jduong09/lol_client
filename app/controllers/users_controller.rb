class UsersController < ApplicationController
  def new
    #dummy user
    @user = User.new

    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_url
    else
      @user.errors.full_messages
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @friends = @user.followers

    if @user
      render :show
    else
      @user.errors.full_messages
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end