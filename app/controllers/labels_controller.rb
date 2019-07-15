class LabelsController < ApplicationController

  def new
    @label = Label.new
    @labels = Label.all
  end

  def create
    @label = Label.new(label_params)
    @label.user_id = current_user.id
    if @label.save
      redirect_to new_label_path, notice: 'ラベルを作成しました'
    else
      render 'new'
    end
  end

  def destroy
    @label = Label.find(params[:format])
    @label.destroy
    redirect_to new_label_path, notice: 'ラベルを削除しました'
  end

  private

  def label_params
    params.require(:label).permit(:label_title, :picture_id, :user_id)
  end
end
