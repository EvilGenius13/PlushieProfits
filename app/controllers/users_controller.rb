class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :update]

  def edit
    @user = current_user
  end

  def update
    if @user.update(user_params)
      redirect_to dashboard_path, notice: 'Username was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = current_user
    redirect_to(root_path, alert: "Not authorized") if @user.id.to_s != params[:id]
  end

  def user_params
    params.require(:user).permit(:username)
  end
end
