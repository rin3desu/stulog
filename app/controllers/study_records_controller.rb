class StudyRecordsController < ApplicationController
  def index
    @user = current_user
    @study_records = StudyRecord.all

    # 科目ごとの合計時間を計算
    @total_time_by_subject = @study_records.group(:subject).sum(:time)

    # 総勉強時間を計算
    @total_study_time = @study_records.sum(:time)

      # Chart.js用のデータ
    @chart_data = @total_time_by_subject.map { |subject, time| { subject: subject, time: time } }.to_json

  end

  def new
    @user = current_user
    @study_record = StudyRecord.new
    @sections = [] # 初期状態では空
  end

  def create
    @study_record = StudyRecord.new(study_record_params)
    if @study_record.save
      redirect_to study_records_path, notice: "勉強記録を追加しました。"
    else
      render :new
    end
  end

  def show
    @study_record = StudyRecord.find(params[:id])
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
