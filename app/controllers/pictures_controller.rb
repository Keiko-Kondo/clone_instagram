class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  before_action :login_check, only: [:index, :edit, :update, :destroy, :new, :show, :confirm]
  # GET /pictures
  # GET /pictures.json
  def index
    @pictures = Picture.all
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  # GET /pictures/new
  def new
    if params[:back]
      @picture = Picture.new(picture_params)
    else
      @picture = Picture.new
    end
  end

  # GET /pictures/1/edit
  def edit
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @picture = current_user.pictures.build(picture_params)
      if params[:back]
        render :new
      else
        if @picture.save
          PictureMailer.picture_mail(@picture).deliver
          redirect_to @picture, notice: 'Picture was successfully created.'
        else
          render :new
        end
      end
  end

  def confirm
    @picture = current_user.pictures.build(picture_params)
    render :new if @picture.invalid?
  end
  # PATCH/PUT /pictures/1
  # PATCH/PUT /pictures/1.json
  def update
      if @picture.update(picture_params)
        redirect_to @picture, notice: 'Picture was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture.destroy
    redirect_to pictures_url, notice: 'Picture was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_picture
    @picture = Picture.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def picture_params
    params.require(:picture).permit(:image, :image_cache, :comment)
  end

  def ensure_correct_user
    @picture = Picture.find(params[:id])
    if current_user.id != @picture.user_id
      redirect_to pictures_url
    end
  end
end
