class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
