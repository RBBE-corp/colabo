class CreateContributions < ActiveRecord::Migration[6.1]
  def change
    create_table :contributions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true
      t.integer :status
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
