class StudyRecordsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @study_records = current_user.study_records.includes(:study_record_likes, :study_record_comments).order(created_at: :desc)
    @total_time_by_subject = current_user.study_records.group(:subject).sum(:time)
    @total_study_time = current_user.study_records.sum(:time)
    @chart_data = @total_time_by_subject.map { |subject, time| { subject: subject, time: time } }.to_json
    @liked_record_ids = current_user.study_record_likes.pluck(:study_record_id)

    following_user_ids = current_user.following.pluck(:id) + [current_user.id]
    @ranking = User.where(id: following_user_ids).map do |u|
      { user: u, total_time: u.study_records.sum(:time) }
    end.sort_by { |r| -r[:total_time] }
  end

  def new
    @user = current_user
    @study_record = StudyRecord.new
    @sections = []
  end

  def create
    @study_record = StudyRecord.new(study_record_params)
    @study_record.user = current_user
    if @study_record.save
      redirect_to study_records_path, notice: "勉強記録を追加しました。"
    else
      render :new
    end
  end

  def show
    @study_record = StudyRecord.find(params[:id])
    @comments = @study_record.study_record_comments.includes(:user).order(created_at: :asc)
    @new_comment = StudyRecordComment.new
  end

  def edit
    @user = current_user
    @study_record = StudyRecord.find(params[:id])
  end

  def update
    @study_record = StudyRecord.find(params[:id])
    if @study_record.update(study_record_params)
      redirect_to study_record_path(@study_record), notice: "勉強記録を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @study_record = StudyRecord.find(params[:id])
    @study_record.destroy
    redirect_to study_records_path, notice: "勉強記録を削除しました。"
  end

  private

  def study_record_params
    params.require(:study_record).permit(:subject, :section, :time, :comment)
  end
end
