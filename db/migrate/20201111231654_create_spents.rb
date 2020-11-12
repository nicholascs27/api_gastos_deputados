class CreateSpents < ActiveRecord::Migration[6.0]
  def change
    create_table :spents do |t|
      t.integer :congressperson_id
      t.string :description
      t.string :provider
      t.decimal :value, precision: 10, scale: 2
      t.integer :month
      t.date :issuance_date
      t.string :document_url

      t.timestamps
    end
  end
end
