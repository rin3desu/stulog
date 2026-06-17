class CreateStudyRecordLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :study_record_likes do |t|
      t.integer :user_id, null: false
      t.integer :study_record_id, null: false
      t.timestamps
    end
    add_index :study_record_likes, [:user_id, :study_record_id], unique: true
    add_index :study_record_likes, :study_record_id
  end
end
