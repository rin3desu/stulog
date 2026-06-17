class AddUserIdToStudyRecords < ActiveRecord::Migration[6.1]
  def change
    add_column :study_records, :user_id, :integer
    add_index :study_records, :user_id
  end
end
