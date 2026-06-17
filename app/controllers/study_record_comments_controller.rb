class StudyRecordCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @study_record = StudyRecord.find(params[:study_record_id])
    @comment = @study_record.study_record_comments.build(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_back(fallback_location: study_record_path(@study_record))
  end

  def destroy
    @study_record = StudyRecord.find(params[:study_record_id])
    @comment = @study_record.study_record_comments.find(params[:id])
    @comment.destroy if @comment.user == current_user
    redirect_back(fallback_location: study_record_path(@study_record))
  end

  private

  def comment_params
    params.require(:study_record_comment).permit(:content)
  end
end
