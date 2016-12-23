class UsersController < ApplicationController
  before_action :require_login, :except => [:create, :new]
  before_action :set_user, only: [:show, :edit, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
      if @user.save
        log_in @user
        flash.notice = "Welcome To RepBook"
        redirect_to edit_user_path @user
      else
      flash.alert = @user.errors.full_messages.first
      redirect_to new_user_path
      end

  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update

          @user = User.find_by_id(params[:id])
          @user.first_name = user_params[:first_name]
          @user.last_name = user_params[:last_name]
          @user.about = user_params[:about]
          @user.avatar = user_params[:avatar] if user_params[:avatar]
          @user.email = user_params[:email] if user_params[:email]
          if @user.save(:validate=>false)
            flash.notice = "Updated Successfully"
          else
            flash.notice = @user.errors.full_messages.first
          end
            # byebug

      redirect_to(edit_user_path(@user))

  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    User.find_by_id(params[:id]).destroy
    log_out
    redirect_to root_url

  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name,:about,:avatar,:password,:email)
    end



    def set_user
      @user = User.find(params[:id])
    end
end
