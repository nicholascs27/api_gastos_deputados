class CreateYearlySpends < ActiveRecord::Migration[6.0]
  def change
    create_table :yearly_spends do |t|
      t.integer :congressperson_id
      t.string :year
      t.decimal :total, precision: 10, scale: 2

      t.timestamps
    end
  end
end
