class PicturesController < ApplicationController
  def index
   @pictures = Picture.all
  end

  def new
    @picture = Picture.new  
  end

  def show
    @picture = Picture.find(params[:id])
    @comments = @picture.comments
    @comment = @picture.comments.build
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
   
    #@favorites = Favorite.where(picture_id: @picture.id).all
    #binding.pry
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    if @picture.save
      redirect_to picture_path(@picture.id), notice: '写真を投稿しました！'
    else
      render 'new'
    end
  end

  def update
    @picture = Picture.find(params[:id]) 
    if @picture.update(picture_params)
      redirect_to picture_path(@picture.id), notice: '写真の編集をしました！'
    else
      render :new
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
      redirect_to pictures_path, notice: '写真を削除しました'
  end

  private

  def picture_params
    params.require(:picture).permit(:image_title, :image_content, :image, :user_id, label_ids:[])
  end
end
