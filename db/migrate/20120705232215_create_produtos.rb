class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.integer :idProduto
      t.decimal :qtdeAferida
      t.references :localizacao

      t.timestamps
    end
    add_index :produtos, :localizacao_id
  end
end
