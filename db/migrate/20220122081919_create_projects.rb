class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :project_name
      t.string :description
      t.integer :people_required
      t.string :location
      t.datetime :start_date
      t.datetime :end_date
      t.string :reward_earned
      t.integer :points_earned
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
