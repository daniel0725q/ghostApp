class CreateExpenditures < ActiveRecord::Migration[5.1]
  def change
    create_table :expenditures do |t|
      t.integer :value
      t.string :name
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
