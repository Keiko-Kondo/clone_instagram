class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def new
    if params[:back]
      @user = User.new(user_params)
    else
      @user = User.new
    end
  end

  def confirm
    @user = User.new(user_params)
  end

  def create
   @user = User.new(user_params)
   if @user.save
    redirect_to user_path(@user.id)
   else
     render :new
   end
  end

  def show
  end

  def edit
  end

  def update
      if @user.update(user_params)
        redirect_to @user, notice: 'Profile was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile_image, :profile_image_cache)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    if current_user.id != @user.id
      redirect_to pictures_url
    end
  end
end
