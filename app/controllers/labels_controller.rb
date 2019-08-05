class LabelsController < ApplicationController
  before_action :require_login

  def new
    @label = Label.new
    @labels = Label.all
  end

  def create
    @label = Label.new(label_params)
    @label.user_id = current_user.id

    unless @label.label_title.length > 11 || @label.label_title.empty?
      if @label.save
        redirect_to new_label_path, notice: 'ラベルを作成しました'
      else
        render 'new'
      end
    else
      redirect_to new_label_path, notice: '1文字以上10文字以内でお願いします。'
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

  def require_login
    unless logged_in?
      redirect_to root_path, notice: 'ログインしてください'
    end
  end
end
