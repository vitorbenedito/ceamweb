class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.integer :idProduto
      t.integer :idLocalizacao
      t.decimal :qtdeEncontrada

      t.timestamps
    end
  end
end
