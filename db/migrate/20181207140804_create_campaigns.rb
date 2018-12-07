class CreateCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :campaigns do |t|
      t.string :title
      t.date :start_date
      t.integer :budget
      t.text :brief
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
