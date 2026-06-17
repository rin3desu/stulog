class StudyRecordLikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @study_record = StudyRecord.find(params[:study_record_id])
    current_user.study_record_likes.create(study_record: @study_record)
    redirect_back(fallback_location: study_records_path)
  end

  def destroy
    @study_record = StudyRecord.find(params[:study_record_id])
    like = current_user.study_record_likes.find_by(study_record: @study_record)
    like&.destroy
    redirect_back(fallback_location: study_records_path)
  end
end
