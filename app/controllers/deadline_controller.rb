class DeadlineController < ApplicationController
  def new
    @deadline = Deadline.new
  end

  def create
    @deadline = Deadline.new(deadline_params)
    if @deadline.save
      redirect_to @deadline, notice: "Deadline was successfully created."
    else
      render :new
    end
  end

  private

  def deadline_params
    params.require(:deadline).permit(:user_id, :content, :penalty, :due_date)
  end
end

