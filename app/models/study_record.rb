class StudyRecord < ApplicationRecord
  belongs_to :user, optional: true
  has_many :study_record_likes, dependent: :destroy
  has_many :liked_users, through: :study_record_likes, source: :user
  has_many :study_record_comments, dependent: :destroy

  def already_liked_by?(user)
    study_record_likes.exists?(user_id: user.id)
  end
end
