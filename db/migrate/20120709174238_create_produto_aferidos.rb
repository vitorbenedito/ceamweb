class CreateProdutoAferidos < ActiveRecord::Migration
  def change
    
    drop_table :produto_aferidos if self.table_exists?("produto_aferidos")
    
    create_table :produto_aferidos do |t|
      t.integer :idProduto
      t.decimal :qtdeAferida
      t.references :balanco

      t.timestamps
    end
    add_index :produto_aferidos, :balanco_id
  end
end
