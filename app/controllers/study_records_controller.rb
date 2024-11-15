class StudyRecordsController < ApplicationController
  def index
    @study_records = StudyRecord.all
    @total_time_by_subject = StudyRecord.group(:subject).sum(:time)
  end

  def new
    @study_record = StudyRecord.new
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
