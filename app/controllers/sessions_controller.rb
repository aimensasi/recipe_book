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

  def facebook_login
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to edit_user_path(user.id)
  end

  private
  def session_params
    params.require(:session).permit(:email, :password)
  end






end


# class SessionsController < Clearance::SessionsController


#   def create_from_omniauth
#     auth_hash = request.env['omniauth.auth']
#     authentication = Authentication.find_by_provider_and_uid(auth)
#   end


#     protected

#   # def auth_hash
#   #   request.env['omniauth.auth']
#   # end
# end