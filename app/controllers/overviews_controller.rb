class OverviewsController < ApplicationController 
  def show
    @user = User.find_by(id: params[:user_id])

    render :show
  end
end