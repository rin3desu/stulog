class CreateStudyRecordComments < ActiveRecord::Migration[6.1]
  def change
    create_table :study_record_comments do |t|
      t.integer :user_id, null: false
      t.integer :study_record_id, null: false
      t.string :content, null: false
      t.timestamps
    end
    add_index :study_record_comments, :study_record_id
    add_index :study_record_comments, :user_id
  end
end
