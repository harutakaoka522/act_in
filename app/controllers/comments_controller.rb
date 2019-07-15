class CommentsController < ApplicationController
  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.build(comment_params)
    @comment.user_id = current_user.id
#binding.pry
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to picture_path(@picture), notice: '投稿できませんでした...' }
      end
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @picture = @comment.picture
    if @comment.update(comment_params)
      redirect_to picture_path(@picture), notice: 'コメントの編集をしました！'
    else
      redirect_to picture_path(@picture), notice: 'コメントの更新が出来ませんでした'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      respond_to do |format| 
        format.js { render :index }
        end
      end
    end

  private

  def comment_params
    params.require(:comment).permit(:picture_id,:content)
  end
end
