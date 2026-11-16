class CreateConferenceSessions < ActiveRecord::Migration[8.1]
  def change
    create_table :conference_sessions do |t|
      t.string :title
      t.text :description
      t.string :track
      t.integer :conference_day
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
