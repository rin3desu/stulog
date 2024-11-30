class DeadlineController < ApplicationController
  def new
    @deadline = Deadline.new
  end

  def show
    @deadline = Deadline.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to deadlines_path, alert: "Deadline not found"
  end

  def create
    # 送信された値から日付を作成
    user_year = params[:deadline][:user_year].to_i
    user_month = params[:deadline][:user_month].to_i
    user_date = params[:deadline][:user_date].to_i
    user_hour = params[:deadline][:user_hour].to_i
    user_min = params[:deadline][:user_min].to_i
    user_sec = params[:deadline][:user_sec].to_i

    due_date = DateTime.new(user_year, user_month, user_date, user_hour, user_min, user_sec)

    # 新しいdeadlineを作成して保存
    @deadline = Deadline.new(due_date: due_date, user_id: current_user.id)

    if @deadline.save
      redirect_to @deadline
    else
      render :new
    end
  end

  private

  def deadline_params
    params.require(:deadline).permit(:user_id, :content, :penalty, :due_date)
  end
end
