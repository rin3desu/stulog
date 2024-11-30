class MypageController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    @deadline = Deadline.find_by(user_id: @user.id)
    @remaining_days = calculate_remaining_days(@deadline) if @deadline.present?
  end

  private

  def calculate_remaining_days(deadline)
    # 現在の日付と目標日付を比較して残り日数を計算
    (deadline.due_date.to_date - Date.today).to_i
  end  
  def link
  end
end
