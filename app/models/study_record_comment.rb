class StudyRecordComment < ApplicationRecord
  belongs_to :user
  belongs_to :study_record
  validates :content, presence: true
end
