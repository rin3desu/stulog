class CreateDeadlines < ActiveRecord::Migration[6.1]
  def change
    create_table :deadlines do |t|
      t.integer :user_id
      t.text    :content
      t.string  :penalty
      t.datetime :due_date

      t.timestamps
    end
  end
end

