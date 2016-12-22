class SessionsController < ApplicationController
  # before_action :store_prev_page, :only => [:new]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(:email => session_params[:email])

    if @user && @user.authenticate(session_params[:password])
      log_in @user

        redirect_to @user

    else
      flash.now.alert = "Invalid Email Or Password"
      render "new"
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

  private
  def session_params
    params.require(:session).permit(:email, :password)
  end
end