class DeadlineController < ApplicationController
  before_action :authenticate_user!

  def new
    @deadline = Deadline.find_by(user_id: current_user.id) || Deadline.new
  end

  def show
    @deadline = Deadline.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to mypage_index_path, alert: "設定が見つかりません"
  end

  def create
    exam_name = params[:deadline][:content]
    exam_date_str = params[:deadline][:exam_date]
    exam_date = Date.parse(exam_date_str) rescue nil

    @deadline = Deadline.find_or_initialize_by(user_id: current_user.id)
    @deadline.assign_attributes(content: exam_name, due_date: exam_date)

    if @deadline.save
      redirect_to mypage_index_path, notice: "試験日を設定しました。"
    else
      render :new
    end
  end
end
