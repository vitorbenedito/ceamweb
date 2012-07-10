class CreateProdutoAferidos < ActiveRecord::Migration
  def change
    create_table :produto_aferidos do |t|
      t.integer :idProduto
      t.decimal :qtdeAferida
      t.references :balanco

      t.timestamps
    end
    add_index :produto_aferidos, :balanco_id
  end
end
