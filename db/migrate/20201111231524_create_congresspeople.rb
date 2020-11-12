class CreateCongresspeople < ActiveRecord::Migration[6.0]
  def change
    create_table :congresspeople do |t|
      t.string :name
      t.string :cpf
      t.string :uf
      t.string :political_party
      t.integer :id_external

      t.timestamps
    end
  end
end
