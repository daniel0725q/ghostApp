class AddDateToExpenditures < ActiveRecord::Migration[5.1]
  def change
    add_column :expenditures, :date, :datetime
  end
end
