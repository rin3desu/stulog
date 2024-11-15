class CreateLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :logs do |t|
      t.string :subject
      t.string :section
      t.integer :time
      t.string :comment

      t.timestamps
    end
  end
end
