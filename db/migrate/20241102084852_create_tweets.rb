class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.string :test
      t.string :subject
      t.string :section
      t.text :comment

      t.timestamps
    end
  end
end
