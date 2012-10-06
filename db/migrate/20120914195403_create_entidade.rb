class CreateEntidade < ActiveRecord::Migration
  def change
    
    drop_table :entidades if self.table_exists?("entidades")
    
    create_table :entidades do |t|
      t.integer :idEntidadeVpsa
      t.integer :cnpjEmpresa

      t.timestamps
    end
    add_index :entidades, [:idEntidadeVpsa, :cnpjEmpresa], :unique => true
  end
end
